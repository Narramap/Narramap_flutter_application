import 'dart:async';
import 'dart:math';
import 'package:ar_flutter_plugin_2/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin_2/datatypes/config_planedetection.dart';
import 'package:ar_flutter_plugin_2/datatypes/node_types.dart';
import 'package:ar_flutter_plugin_2/datatypes/hittest_result_types.dart';
import 'package:ar_flutter_plugin_2/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin_2/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin_2/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin_2/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin_2/models/ar_anchor.dart';
import 'package:ar_flutter_plugin_2/models/ar_hittest_result.dart';
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
  late ARLocationManager arLocationManager;
  late ARAnchorManager arAnchorManager;
  
  List<Post> posts = [];
  List<Post> nearbyPosts = [];
  Map<String, double> postDistances = {};
  Map<String, ARNode> postNodes = {};
  Position? userLocation;
  bool arInitialized = false;
  Post? selectedPost;
  bool showPostsPanel = true;

  ARAnchor? currentAnchor;
  vector.Matrix4? cameraPose;
  
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





  Future<void> _placePostInFront(Post post) async {
    setState(() => selectedPost = post);
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Toque en una superficie plana para colocar el modelo'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }


  Future<void> _removeAllPosts() async {
    try {
      // Crear una copia de las keys para evitar modificaciones durante la iteración
      final keys = postNodes.keys.toList();
      for (final key in keys) {
        try {
          await arObjectManager.removeNode(postNodes[key]!);
          postNodes.remove(key);
        } catch (e) {
          debugPrint('Error al remover nodo $key: $e');
        }
      }
      setState(() => selectedPost = null);
      debugPrint('Todos los modelos removidos exitosamente');
    } catch (e, stack) {
      debugPrint('Error en _removeAllPosts: $e');
      debugPrint('Stack trace: $stack');
    }
  }

  double _degToRad(double deg) => deg * math.pi / 180.0;
  
  double _calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const earthRadius = 6371000;
    final dLat = _degToRad(lat2 - lat1);
    final dLon = _degToRad(lon2 - lon1);
    final a = sin(dLat/2) * sin(dLat/2) +
              cos(_degToRad(lat1)) * cos(_degToRad(lat2)) * sin(dLon/2) * sin(dLon/2);
    final c = 2 * atan2(sqrt(a), sqrt(1-a));
    return earthRadius * c;
  }


  Future<void> _onPlaneTapped(List<ARHitTestResult> hitTestResults) async {
    if (hitTestResults.isEmpty || selectedPost == null) return;

    try {
      // 1. Obtener el primer plano detectado
      final hit = hitTestResults.firstWhere(
        (result) => result.type == ARHitTestResultType.plane,
      );

      final newAnchor = ARPlaneAnchor(transformation: hit.worldTransform);

      bool? didAddAnchor = await arAnchorManager.addAnchor(newAnchor);

      if(didAddAnchor!) {
        currentAnchor = newAnchor;

        final node = ARNode(
          type: NodeType.localGLTF2,
          uri: "assets/models/enojo.glb",
          position: vector.Vector3(0, 0, 0),
          rotation: vector.Vector4(1, 0, 0, 0),
          scale: vector.Vector3(0.5, 0.5, 0.5),
        );

        if (postNodes.containsKey(selectedPost!.id)) {
          await arObjectManager.removeNode(postNodes[selectedPost!.id]!);
        }

        final didAdd = await arObjectManager.addNode(node, planeAnchor: newAnchor);
        if (didAdd != null && didAdd) {
          postNodes[selectedPost!.id] = node;
        } else {
          AlertDialog(
            title: Text("Error"),
            content: Text("no se pudo anadir el nodo al plano"),
          );
        } 

      } else {
        AlertDialog(
          title: Text("error"),
          content: Text("no se pudo anadir el nodo al plano"),
        );
      }

    } catch (e) {
      debugPrint('Error colocando modelo en plano: $e');
    }
  }
  

  void _onARViewCreated(
    ARSessionManager arSessionManager,
    ARObjectManager arObjectManager,
    ARAnchorManager arAnchorManager,
    ARLocationManager arLocationManager,
  ) async {
    this.arSessionManager = arSessionManager;
    this.arObjectManager = arObjectManager;
    this.arAnchorManager = arAnchorManager;

    await arSessionManager.onInitialize(
      showFeaturePoints: false,
      showPlanes: true, // Habilitar detección de planos
      showWorldOrigin: true,
      // handleTaps: true, // Habilitar taps para colocar modelos
      showAnimatedGuide: false,
      customPlaneTexturePath: "Triangle.png"
    );

    arObjectManager.onInitialize();
    
    // Manejar taps en planos
    arSessionManager.onPlaneOrPointTap = _onPlaneTapped;
    
    setState(() => arInitialized = true);
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
                    ARView(
                      onARViewCreated: _onARViewCreated,
                      planeDetectionConfig: PlaneDetectionConfig.horizontalAndVertical,
                    ),

                    Positioned(
                      bottom: 100,
                      left: 100,
                      child: FloatingActionButton(
                        onPressed: () => setState(() => showPostsPanel = !showPostsPanel),
                        backgroundColor: Colors.black.withOpacity(0.7),
                        mini: true,
                        child: Icon(
                          showPostsPanel ? Icons.visibility_off : Icons.visibility,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    
                    // Panel superior con información
                    if(showPostsPanel)
                    Positioned(
                      top: 120,
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
                      bottom: 100,
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