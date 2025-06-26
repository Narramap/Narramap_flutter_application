
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:narramap/core/navigation/routes.dart';

class CustomBottomNavigationBar extends StatelessWidget {

  var currentIndex = 0;
  CustomBottomNavigationBar({super.key});

  

  @override
  Widget build(BuildContext context) {

    changeIndex (int index) {
      switch(index) {
        case 0: context.push(Routes.home.label);
        case 1: context.push(Routes.aditionSelector.label);
        default: print("no existe una ruta para este index");
      }
    }

    return BottomNavigationBar(
      elevation: 10,
      currentIndex: currentIndex,
      onTap: changeIndex,
      selectedItemColor: Colors.black,
      unselectedItemColor: Color(0xFFA9A9A9),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.location_pin,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add,
          ),
          label: ""
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.camera,
          ),
          label: ""
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.switch_account,
          ),
          label: ""
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle,
          ),
          label: ""
        ),
      ]
    );
  }
}