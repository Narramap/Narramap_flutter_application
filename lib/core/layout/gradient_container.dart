
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {

  final List<Widget> children;
  const GradientContainer({
    super.key,
    required this.children
  });

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/login_background.png",
              fit: BoxFit.cover,
            )
          ),
          Positioned.fill(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'assets/images/logo_narramap.png',
                        width: 70,
                      ),
                      SizedBox(height: 40),
                      ...children
                    ],
                  ),
                )
              ]
            )
          )
        ]
        
      ),
    );
  }
}