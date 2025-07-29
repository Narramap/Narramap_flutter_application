import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:narramap/core/navigation/routes.dart';
import 'package:narramap/core/storage/secure_storage.dart';
import 'package:narramap/shared/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:narramap/shared/presentation/widgets/custom_switch.dart';


class StackableScaffold extends StatelessWidget {

  final Widget child;
  final Widget? positionedStackableContent;
  const StackableScaffold({
    super.key,
    required this.child,
    this.positionedStackableContent
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 10,
        children: [
          FloatingActionButton(
            onPressed: () => context.push(Routes.addEvent.label),
            backgroundColor: Color(0xFFF2F2F2),
            heroTag: "evento",
            child: Text("📅", style: TextStyle(fontSize: 20)),
          ),
          FloatingActionButton(
            onPressed: () => context.push(Routes.addEco.label),
            backgroundColor: Color(0xFFF2F2F2),
            heroTag: "eco",
            child: Text("💭", style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 70,)
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: child
          ),
    
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 30),
                  Image.asset(
                    "assets/images/logo_narramap.png",
                    width: 70,
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: IconButton(
                      onPressed: () async {
                        SecureStorage.clearAuthData();
                        context.go(Routes.login.label);
                      }, 
                      icon: Icon(
                        Icons.logout,
                        color: TextColor.gray.textColor,
                      )
                    ),
                  )
                ],
              ),
            ),
          ),

          if(positionedStackableContent != null)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: positionedStackableContent!
            ),


    
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