import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:narramap/core/navigation/routes.dart';
import 'package:narramap/core/widgets/custom_bottom_navigation_bar.dart';

class StackableScaffold extends StatelessWidget {

  final Widget child;
  const StackableScaffold({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // Importante para que el fondo se vea tras el nav bar
      backgroundColor: Colors.transparent,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 10,
        children: [
          FloatingActionButton(
            onPressed: () => context.push(Routes.addEvent.label),
            backgroundColor: Color(0xFFF2F2F2),
            child: Text("📅", style: TextStyle(fontSize: 20)),
          ),
          FloatingActionButton(
            onPressed: () => context.push(Routes.addEco.label),
            backgroundColor: Color(0xFFF2F2F2),
            child: Text("💭", style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 70,)
        ],
      ),
      body: Stack(
        children: [
          /// Capa de mapa (MapLayer)
          Positioned.fill(
            child: child
          ),
    
          Positioned(
            top: 50, // Ajusta este valor según tu padding superior
            left: 20,
            right: 20,
            child: Container(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/logo_narramap.png",
                width: 70,
              ),
            ),
          ),
    
          /// Bottom Navigation flotante sobre el mapa
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomBottomNavigationBar(),
          ),
        ],
      ),
    );
  }
}