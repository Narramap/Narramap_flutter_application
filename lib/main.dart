import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:narramap/core/DI/get_it_config.dart';
import 'package:narramap/core/localAuthentication/local_auth.dart';
import 'package:narramap/core/navigation/go_route.dart';
import 'package:narramap/theme/app_theme.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final auth = LocalAuth();

  final secure = await auth.checkDeviceSecurity();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Solo modo vertical hacia arriba
  ]);
  configureDependencies();
  runApp( secure ? const MyApp() : const InvalidApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // showPerformanceOverlay: true,
      debugShowCheckedModeBanner: false,
      title: 'Narramap',
      theme: AppTheme.theme,
      routerConfig: goRouter,
    );
  }
}

class InvalidApp extends StatelessWidget {

  const InvalidApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Configuracion de seguridad invalida",
      home: Center(
        child: Text("Necesita configurar una politica de autenticacion en su celular para poder usar la aplicacion"),
      ),
    );
  }
}

