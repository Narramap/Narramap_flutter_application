
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {

  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: ""
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_pin),
          label: ""
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_rounded),
          label: ""
        ),
      ]
    );
  }
}