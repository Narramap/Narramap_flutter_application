import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:narramap/core/layout/gradient_container.dart';
import 'package:narramap/core/navigation/routes.dart';
import 'package:narramap/core/widgets/custom_button.dart';
import 'package:narramap/core/widgets/custom_text_field.dart';
import 'package:narramap/core/widgets/password_text_field.dart';
import 'package:narramap/users/presentation/notifiers/login_notifier.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginNotifier(),
      child: GradientContainer(
        children: [
          Consumer<LoginNotifier>(
            builder: (context, notifier, _) => Column(
              children: [
                CustomTextField(
                  onChanged: notifier.onUpdateEmail,
                  label: "Correo electronico",
                  spacerHeight: 40,
                ),
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PasswordTextField(
                      onChanged: notifier.onUpdatePassword, 
                      changeShowPassword: notifier.changeShowPassword, 
                      showPassword: notifier.showPassword,
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
              ],
            )
          )
          
        ]
      ),
    );
  }
}