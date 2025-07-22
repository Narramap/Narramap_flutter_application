import 'package:ar_flutter_plugin_2/datatypes/config_planedetection.dart';
import 'package:ar_flutter_plugin_2/datatypes/hittest_result_types.dart';
import 'package:ar_flutter_plugin_2/datatypes/node_types.dart';
import 'package:ar_flutter_plugin_2/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin_2/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin_2/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin_2/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin_2/models/ar_hittest_result.dart';
import 'package:flutter/material.dart';
import 'package:ar_flutter_plugin_2/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin_2/models/ar_node.dart';
import 'package:geolocator/geolocator.dart';
import 'package:narramap/aumented_reality.dart/presentation/notifiers/aumented_reality_notifier.dart';
import 'package:narramap/content/domain/model/post.dart';
import 'package:narramap/core/Location/location_service.dart';
import 'package:narramap/core/layout/stackable_scaffold.dart';
import 'package:provider/provider.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

void main() {
  runApp(MaterialApp(home: ARViewScreen()));
}

class ARViewScreen extends StatefulWidget {
  @override
  _ARViewScreenState createState() => _ARViewScreenState();
}

class _ARViewScreenState extends State<ARViewScreen> {
  late ARSessionManager arSessionManager;
  late ARObjectManager arObjectManager;
  late ARLocationManager arLocationManager;
  List<ARNode> nodes = [];
  List<Post> posts = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // final notifier = Provider.of<AumentedRealityNotifier>(context, listen: false);
      // await notifier.getPosts();
      // posts = notifier.posts;

      // Verifica cercanía y coloca modelos si es necesario
      await placeNearbyModels();
    });
  }

  vector.Vector3 calculateRelativePosition(
    double userLat,
    double userLon,
    double targetLat,
    double targetLon,
  ) {
    // Escala ficticia para convertir grados a metros (solo para distancias pequeñas)
    const double metersPerDegreeLat = 111_320; // aproximadamente
    const double metersPerDegreeLon = 111_320;

    final dx = (targetLon - userLon) * metersPerDegreeLon;
    final dz = (targetLat - userLat) * metersPerDegreeLat;

    // Convertimos metros a unidades del espacio AR (asume 1m = 1 unidad)
    return vector.Vector3(dx.toDouble(), 0, dz.toDouble());
  }


  Future<void> placeNearbyModels() async {
    Position userPosition = await Geolocator.getCurrentPosition();

    for (final post in posts) {
      double distance = Geolocator.distanceBetween(
        userPosition.latitude,
        userPosition.longitude,
        post.location.latitude,
        post.location.longitude,
      );

      print("Distancia al post ${post.id}: ${distance.toStringAsFixed(2)} m");

      if (distance < 20) {
        vector.Vector3 direction = calculateRelativePosition(
          userPosition.latitude,
          userPosition.longitude,
          post.location.latitude,
          post.location.longitude,
        );

        final node = ARNode(
          type: NodeType.localGLTF2,
          uri: "assets/models/enojo.glb", // O cambia según la emoción del post
          scale: vector.Vector3(0.2, 0.2, 0.2),
          position: direction, // Posición relativa a la cámara
          rotation: vector.Vector4.zero(),
        );

        final didAdd = await arObjectManager.addNode(node);
        if (didAdd == true) {
          nodes.add(node);
          print("Modelo colocado para post ${post.id}");
        }
      }
    }
  }


  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => AumentedRealityNotifier(),
      child: Consumer<AumentedRealityNotifier>(
        builder: (context, notifier, _) {

          return FutureBuilder(
            future: notifier.getPosts(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else {
                posts = notifier.posts;
                return StackableScaffold(
                  child: ARView(
                    onARViewCreated: onARViewCreated,
                    planeDetectionConfig: PlaneDetectionConfig.horizontalAndVertical,
                  ) 
                );
              }
            },
          );
        }
      ),
    ); 
  }

  Future<bool> isUserNearTarget(double targetLatitude, double targetLongitude) async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    Position position = await Geolocator.getCurrentPosition();

    double distance = Geolocator.distanceBetween(
      position.latitude,
      position.longitude,
      targetLatitude,
      targetLongitude,
    );

    print("Distancia al modelo: ${distance.toStringAsFixed(2)}m");

    return distance < 20;
  }


  void onARViewCreated(
    ARSessionManager sessionManager,
    ARObjectManager objectManager,
    ARAnchorManager anchorManager,
    ARLocationManager locationManager,
  ) {
    arSessionManager = sessionManager;
    arObjectManager = objectManager;
    arLocationManager = locationManager;

    arSessionManager.onInitialize(
      showFeaturePoints: false,
      showPlanes: true,
      customPlaneTexturePath: "Triangle.png",
      showWorldOrigin: true,
    );
    arSessionManager.onPlaneOrPointTap = onPlaneTap;
    arObjectManager.onInitialize();

  }

  Future<void> onPlaneTap(List<ARHitTestResult> hitTestResults) async {

    print(posts);

    for(int i = 0; i <posts.length ; i++ ){
      bool isNear = await isUserNearTarget(posts[i].location.latitude, posts[i].location.longitude);

      if (!isNear) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text("Acércate al punto para ver el modelo")),
        // );
        print("no hay cerca posts");
        break;

      }

      final hit = hitTestResults.firstWhere(
        (hit) => hit.type == ARHitTestResultType.plane,
        orElse: () => hitTestResults.first,
      );

      final node = ARNode(
        type: NodeType.localGLTF2,
        uri: "assets/models/enojo.glb",
        scale: vector.Vector3(0.2, 0.2, 0.2),
        position: hit.worldTransform.forward,
        rotation: hit.worldTransform.row0,
      );
        print("--------------------previo al anadido-----------------");

      final didAddNode = await arObjectManager.addNode(node);
      if (didAddNode == true) {
        nodes.add(node);
        print("--------------------anadido-----------------");
      }

    }
    
  }


  @override
  void dispose() {
    arSessionManager.dispose();
    super.dispose();
  }
}
