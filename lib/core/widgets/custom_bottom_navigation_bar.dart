
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
      currentIndex: currentIndex,
      onTap: changeIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.location_pin,
            color: Color(0xFFA9A9A9),
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add,
            color: Color(0xFFA9A9A9)
          ),
          label: ""
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.camera,
            color: Color(0xFFA9A9A9)
          ),
          label: ""
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.switch_account,
            color: Color(0xFFA9A9A9)
          ),
          label: ""
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle,
            color: Color(0xFFA9A9A9)
          ),
          label: ""
        ),
      ]
    );
  }
}