import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:narramap/core/layout/gradient_container.dart';
import 'package:narramap/core/navigation/routes.dart';
import 'package:narramap/core/widgets/custom_button.dart';
import 'package:narramap/core/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      children: [
        CustomTextField(
          onChanged: (String hola) {},
          label: "Correo electronico",
          spacerHeight: 40,
        ),
        
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              onChanged: (String hola) {},
              label: "Contrasena",
              spacerHeight: 10,
            ),
            GestureDetector(
              child: Text(
                "Registrate aqui",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                ),
              ),
              onTap: () => context.push(Routes.register.label),
            )
          ],
        ),
        SizedBox(height: 80),
        
        CustomButton(
          text: "Iniciar Sesion", 
          onPressed: () => context.push(Routes.home.label)
        )
      ]
    );
  }
}