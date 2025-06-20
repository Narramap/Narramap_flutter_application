import 'package:flutter/material.dart';
import 'package:narramap/core/navigation/go_route.dart';
import 'package:narramap/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Narramap',
      theme: AppTheme.theme,
      routerConfig: goRouter,
    );
  }
}

