
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:narramap/core/layout/gradient_container.dart';
import 'package:narramap/core/navigation/routes.dart';
import 'package:narramap/core/widgets/custom_button.dart';

class AditionSelectorScreen extends StatelessWidget {
  const AditionSelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      children: [
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
      ]
    );
  }
}