
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:narramap/core/navigation/routes.dart';
import 'package:narramap/core/widgets/custom_button.dart';

class SelectorAddModal extends StatelessWidget {
  const SelectorAddModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            // Blur background
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ),

            // Modal content
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/images/logo_narramap.png",
                      width: 70,
                    ),
                    SizedBox(height: 40),
                    CustomButton(
                      text: "Nuevo Eco", 
                      onPressed: () => context.push(Routes.addEco.label),
                      buttonColor: ButtonColors.transparent,
                    ),
                    SizedBox(height: 40),
                    CustomButton(
                      text: "Nuevo Evento", 
                      onPressed: () => context.push(Routes.addEvent.label),
                      buttonColor: ButtonColors.transparent,
                    ),
                    SizedBox(height: 40),
                    CustomButton(
                      text: "Nuevo Comercio", 
                      onPressed: () => context.push(Routes.addBussiness.label),
                      buttonColor: ButtonColors.transparent,
                    ),
                    SizedBox(height: 40),
                    CustomButton(
                      text: "Cancelar", 
                      onPressed: () => context.pop()
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
  }
}