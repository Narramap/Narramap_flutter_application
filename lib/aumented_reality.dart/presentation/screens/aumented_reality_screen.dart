import 'package:flutter/material.dart';
import 'package:narramap/aumented_reality.dart/presentation/widgets/aumented_reality_scene.dart';
import 'package:narramap/core/layout/stackable_scaffold.dart';

class AumentedRealityScreen extends StatelessWidget {
  const AumentedRealityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StackableScaffold(
      child: AumentedRealityScene()
    );
  }
}