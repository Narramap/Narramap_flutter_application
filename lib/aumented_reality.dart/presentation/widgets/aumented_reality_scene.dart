import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/models/ar_hittest_result.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:ar_flutter_plugin/models/ar_anchor.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class AumentedRealityScene extends StatefulWidget {
  const AumentedRealityScene({super.key});

  @override
  State<AumentedRealityScene> createState() => _AumentedRealitySceneState();
}

class _AumentedRealitySceneState extends State<AumentedRealityScene> {
  late ARSessionManager arSessionManager;
  late ARObjectManager arObjectManager;
  List<ARNode> nodes = [];

  @override
  void dispose() {
    arSessionManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ARView(
      onARViewCreated: onARViewCreated,
    );
  }

  void onARViewCreated(ARSessionManager sessionManager, ARObjectManager objectManager, ARAnchorManager anchorManager, ARLocationManager locationManager) {
    arSessionManager = sessionManager;
    arObjectManager = objectManager;

    arSessionManager.onInitialize(
      showFeaturePoints: false,
      showPlanes: true,
      customPlaneTexturePath: "assets/images/plane_texture.png", // opcional
      showWorldOrigin: true,
      handleTaps: true,
    );
    arObjectManager.onInitialize();

    arSessionManager.onPlaneOrPointTap = onPlaneTapped;
  }

  Future<void> onPlaneTapped(List<ARHitTestResult> hits) async {
    if (hits.isEmpty) return;

    final hit = hits.first;

    var newNode = ARNode(
      type: NodeType.webGLB,
      uri: "https://modelviewer.dev/shared-assets/models/Astronaut.glb",
      scale: vector.Vector3(0.2, 0.2, 0.2),
      position: hit.worldTransform.forward,
      rotation: vector.Vector4(0, 0, 0, 0),
    );

    bool? didAdd = await arObjectManager.addNode(newNode);
    if (didAdd == true) {
      nodes.add(newNode);
    } else {
      debugPrint("❌ No se pudo añadir el nodo al entorno AR.");
    }
  }
}
