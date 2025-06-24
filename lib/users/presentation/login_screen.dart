import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:narramap/core/navigation/routes.dart';
import 'package:narramap/core/widgets/custom_button.dart';
import 'package:narramap/core/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'assets/images/logo_narramap.png',
                    width: 70,
                  ),
                  CustomTextField(
                    onChanged: (String hola) {},
                    label: "Correo electronico",
                    spacerHeight: 20,
                  ),
                  CustomTextField(
                    onChanged: (String hola) {},
                    label: "Contrasena",
                    spacerHeight: 20,
                  ),
                  GestureDetector(
                    child: Text("Registrate aqui"),
                    onTap: () => context.push(Routes.register.label),
                  ),
                  CustomButton(
                    text: "Iniciar Sesion", 
                    onPressed: () => context.push(Routes.home.label)
                  )
                ],
              ),
            )
          )
        ]
        
      ),
    );
  }
}