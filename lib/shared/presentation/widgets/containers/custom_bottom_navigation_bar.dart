import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:narramap/core/navigation/routes.dart';
import 'package:narramap/core/storage/secure_storage.dart';
import 'package:narramap/users/domain/model/user_profile.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  int currentIndex;

  static CustomBottomNavigationBar? _instance;

  CustomBottomNavigationBar({super.key, this.currentIndex = 0});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();

  static CustomBottomNavigationBar getInstance() {
    if(_instance != null) {
      return _instance!;
    } else {
      _instance = CustomBottomNavigationBar();
      return _instance!;
    }
  }
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {

  bool business = false;

  Future<void> _getUserProfile() async {

    final userProfile = await SecureStorage.getUserProfile();
    setState(() {
      business = userProfile!.bussiness;
    });
  }


  @override
  void initState() {
    super.initState();
    _getUserProfile();

  }

  @override
  Widget build(BuildContext context) {
    void changeIndex(int index) {

      if(business) {
        switch (index) {
          case 0:
            context.go(Routes.home.label);
            break;
          case 1:
            context.go(Routes.aumentedReality.label);
            break;
          case 2:
            context.go(Routes.redirectionBussiness.label);
            break;
          case 4:
            context.go(Routes.publicProfile.label);
            break;

            
          default:
            print("No existe una ruta para este index");
          
        }
      } else { 

        switch (index) {
          case 0:
            context.go(Routes.home.label);
            break;
          case 1:
            context.go(Routes.aumentedReality.label);
            break;
          
          case 3:
            context.go(Routes.publicProfile.label);
            break;

            
          default:
            print("No existe una ruta para este index");
          
        }

      }
      

      setState(() {
        widget.currentIndex = index;
      });
    }

    final items = [
      const BottomNavigationBarItem(icon: Icon(Icons.location_pin), label: ""),
      const BottomNavigationBarItem(icon: Icon(Icons.camera), label: ""),
      if (business)
        const BottomNavigationBarItem(icon: Icon(Icons.store), label: ""),
      const BottomNavigationBarItem(icon: Icon(Icons.switch_account), label: ""),
      const BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: ""),
    ];

    final currentIndex = widget.currentIndex.clamp(0, items.length - 1);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent, // Fondo transparente
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(115, 58, 58, 58), // sombra leve
                blurRadius: 12,
                offset: const Offset(0, -4), // solo hacia arriba
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.white.withOpacity(0.85), // barra semitransparente
              elevation: 0,
              currentIndex: widget.currentIndex,
              onTap: changeIndex,
              selectedItemColor: const Color(0xFFA9A9A9),
              unselectedItemColor: const Color(0xFFA9A9A9),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: items,
            ),
          ),
        ),
      ),
    );
  }
}
