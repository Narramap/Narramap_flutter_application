import 'dart:math';
import 'package:ar_flutter_plugin_2/datatypes/node_types.dart';
import 'package:ar_flutter_plugin_2/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin_2/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin_2/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin_2/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin_2/models/ar_node.dart';
import 'package:ar_flutter_plugin_2/widgets/ar_view.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:narramap/aumented_reality.dart/presentation/notifiers/aumented_reality_notifier.dart';
import 'package:narramap/content/domain/model/post.dart';
import 'package:narramap/core/DI/get_it_config.dart';
import 'package:narramap/core/Location/location_service.dart';
import 'package:narramap/core/layout/stackable_scaffold.dart';
import 'package:narramap/map/domain/use_cases/get_all_posts_use_case.dart';
import 'package:provider/provider.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'dart:math' as math;

class AumentedRealityPage extends StatefulWidget {
  const AumentedRealityPage({super.key});

  @override
  State<AumentedRealityPage> createState() => _AumentedRealityPageState();
}

class _AumentedRealityPageState extends State<AumentedRealityPage> {
  late ARSessionManager arSessionManager;
  late ARObjectManager arObjectManager;
  
  List<Post> posts = [];
  List<Post> nearbyPosts = [];
  Map<String, double> postDistances = {};
  Map<String, ARNode> postNodes = {};
  Position? userLocation;
  bool arInitialized = false;
  Post? selectedPost;
  
  // Configuración
  final double scaleFactor = 1.0;
  final double maxVisibleDistance = 100.0;
  final double activationDistance = 2.0; // Distancia para mostrar botón (5 metros)

  Future<void> _getPosts() async {

    final getUseCase = getIt<GetAllPostsUseCase>();

    final postG = await getUseCase.run();

    if(postG != null) {
      posts = postG;
    }
  }

  @override
  void initState() {
    super.initState();
    _getPosts();
  }

  @override
  void dispose() {
    arSessionManager.dispose();
    super.dispose();
  }

  Future<void> _updateUserLocation() async {
    try {
      final location = await LocationService().getCurrentLocation();
      if (location == null) return;

      setState(() => userLocation = location);
      await _updateNearbyPosts();
    } catch (e) {
      debugPrint('Error obteniendo ubicación: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error obteniendo ubicación')),
        );
      }
    }
  }

  Future<void> _updateNearbyPosts() async {
    if (userLocation == null) return;

    final newDistances = <String, double>{};
    final newNearbyPosts = <Post>[];
    
    for (final post in posts) {
      final distance = _calculateDistance(
        userLocation!.latitude,
        userLocation!.longitude,
        post.location.latitude,
        post.location.longitude,
      );
      
      newDistances[post.id] = distance;
      
      if (distance <= maxVisibleDistance) {
        newNearbyPosts.add(post);
      }
    }

    setState(() {
      postDistances = newDistances;
      nearbyPosts = newNearbyPosts;
      selectedPost = null; // Resetear post seleccionado al actualizar
    });

    // await _updateARPosts();
  }

  Future<void> _updateARPosts() async {
    try {
      // Colocar/actualizar todos los posts cercanos
      for (final post in nearbyPosts) {
        await _placePostInWorld(post);
      }
    } catch (e) {
      debugPrint('Error actualizando posts AR: $e');
    }
  }

  Future<void> _placePostInWorld(Post post) async {
    try {
      if (userLocation == null) return;

      final position = _calculateARPosition(
        userLat: userLocation!.latitude,
        userLon: userLocation!.longitude,
        targetLat: post.location.latitude,
        targetLon: post.location.longitude,
      );

      final existingNode = postNodes[post.id];
      
      if (existingNode != null) {
        if (existingNode.position != position) {
          await arObjectManager.removeNode(existingNode);
          existingNode.position = position;
          await arObjectManager.addNode(existingNode);
        }
      } else {
        final node = ARNode(
          name: 'post_${post.id}_world',
          type: NodeType.localGLTF2,
          uri: "assets/models/shiba.glb",
          position: position,
          scale: vector.Vector3(0.3, 0.3, 0.3),
        );
        
        final didAdd = await arObjectManager.addNode(node);
        if (didAdd != null && didAdd) {
          postNodes[post.id] = node;
        }
      }
    } catch (e) {
      debugPrint('Error colocando post en mundo: $e');
    }
  }

  Future<void> _placePostInFront(Post post) async {
    try {
      final existingNode = postNodes[post.id];
      final frontPosition = vector.Vector3(0, 0, 0); // 1.5m frente a cámara

      if (existingNode != null) {
        await arObjectManager.removeNode(existingNode);
        existingNode.position = frontPosition;
        await arObjectManager.addNode(existingNode);
      } else {
        final node = ARNode(
          name: 'post_${post.id}_front',
          type: NodeType.localGLTF2,
          uri: "assets/models/shiba.glb",
          position: frontPosition,
          scale: vector.Vector3(0.5, 0.5, 0.5),
        );
        
        final didAdd = await arObjectManager.addNode(node);
        if (didAdd != null && didAdd) {
          postNodes[post.id] = node;
        }
      }

      setState(() => selectedPost = post);
    } catch (e) {
      debugPrint('Error colocando post frente: $e');
    }
  }

  Future<void> _removeAllPosts() async {
    try {
      for (final node in postNodes.values) {
        await arObjectManager.removeNode(node);
      }
      postNodes.clear();
      setState(() => selectedPost = null);
    } catch (e) {
      debugPrint('Error removiendo posts: $e');
    }
  }

  double _degToRad(double deg) => deg * math.pi / 180.0;
  
  vector.Vector3 _calculateARPosition({
    required double userLat,
    required double userLon,
    required double targetLat,
    required double targetLon,
  }) {
    const earthRadius = 6371000.0;
    final dLat = _degToRad(targetLat - userLat);
    final dLon = _degToRad(targetLon - userLon);
    final lat1 = _degToRad(userLat);
    final lat2 = _degToRad(targetLat);

    final a = math.sin(dLat/2) * math.sin(dLat/2) +
              math.cos(lat1) * math.cos(lat2) * math.sin(dLon/2) * math.sin(dLon/2);
    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1-a));
    final distance = earthRadius * c;

    final y = math.sin(dLon) * math.cos(lat2);
    final x = math.cos(lat1)*math.sin(lat2) - math.sin(lat1)*math.cos(lat2)*math.cos(dLon);
    final bearing = math.atan2(y, x);

    return vector.Vector3(
      distance * math.sin(bearing) * scaleFactor,
      0.0,
      -distance * math.cos(bearing) * scaleFactor
    );
  }
  
  double _calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const earthRadius = 6371000;
    final dLat = _degToRad(lat2 - lat1);
    final dLon = _degToRad(lon2 - lon1);
    final a = sin(dLat/2) * sin(dLat/2) +
              cos(_degToRad(lat1)) * cos(_degToRad(lat2)) * sin(dLon/2) * sin(dLon/2);
    final c = 2 * atan2(sqrt(a), sqrt(1-a));
    return earthRadius * c;
  }

  Future<void> _initializeAR() async {
    try {
      await arSessionManager.onInitialize(
        showFeaturePoints: false,
        showPlanes: false,
        showWorldOrigin: false,
        handleTaps: false,
      );

      arObjectManager.onInitialize();
      await Future.delayed(const Duration(seconds: 1));
      
      setState(() => arInitialized = true);
      await _updateUserLocation();
    } catch (e) {
      debugPrint('AR Initialization failed: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error inicializando AR: ${e.toString()}')),
        );
      }
    }
  }

  void _onARViewCreated(
    ARSessionManager arSessionManager,
    ARObjectManager arObjectManager,
    ARAnchorManager arAnchorManager,
    ARLocationManager arLocationManager,
  ) {
    this.arSessionManager = arSessionManager;
    this.arObjectManager = arObjectManager;
    _initializeAR();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AumentedRealityNotifier(),
      child: Consumer<AumentedRealityNotifier>(
        builder: (context, notifier, _) {
          // return FutureBuilder(
          //   future: notifier.getPosts(),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return const Center(child: CircularProgressIndicator());
          //     }
              
              // posts = notifier.posts;
              return StackableScaffold(
                child: Stack(
                  children: [
                    ARView(onARViewCreated: _onARViewCreated),
                    
                    // Panel superior con información
                    Positioned(
                      top: 100,
                      left: 20,
                      right: 20,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.location_on, color: Colors.white, size: 20),
                                const SizedBox(width: 8),
                                Text(
                                  'Posts cercanos: ${nearbyPosts.length}/${posts.length}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                IconButton(
                                  icon: const Icon(Icons.refresh, color: Colors.white),
                                  onPressed: _updateUserLocation,
                                  tooltip: 'Actualizar ubicación',
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            ...nearbyPosts.map((post) {
                              final distance = postDistances[post.id] ?? 0;
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '• ${post.title}: ${distance.toStringAsFixed(2)} m',
                                        style: TextStyle(
                                          color: distance <= activationDistance
                                              ? Colors.greenAccent
                                              : Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    if (distance <= activationDistance)
                                      TextButton(
                                        onPressed: () => _placePostInFront(post),
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          minimumSize: const Size(30, 30),
                                        ),
                                        child: const Text(
                                          'Mostrar',
                                          style: TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                    
                    // Botón para limpiar todos los posts
                    Positioned(
                      bottom: 200,
                      left: 20,
                      child: FloatingActionButton(
                        onPressed: _removeAllPosts,
                        backgroundColor: Colors.red,
                        mini: true,
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                    ),
                    
                    // Botón para volver a colocar el post seleccionado
                    if (selectedPost != null)
                      Positioned(
                        bottom: 200,
                        right: 20,
                        child: FloatingActionButton(
                          onPressed: () => _placePostInFront(selectedPost!),
                          backgroundColor: Colors.blue,
                          child: const Icon(Icons.center_focus_strong, color: Colors.white),
                        ),
                      ),
                    
                    // Estado de carga
                    if (!arInitialized)
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                  ],
                ),
              );
            },
          // );
        // },
      ),
    );
  }
}