
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:narramap/core/layout/gradient_container.dart';
import 'package:narramap/core/widgets/custom_button.dart';
import 'package:narramap/core/widgets/custom_checklist.dart';
import 'package:narramap/core/widgets/custom_radio_button.dart';
import 'package:narramap/core/widgets/custom_switch.dart';
import 'package:narramap/core/widgets/custom_text_field.dart';
import 'package:narramap/core/widgets/password_text_field.dart';
import 'package:narramap/core/widgets/quantity_selector.dart';
import 'package:narramap/users/presentation/notifiers/register_notifier.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return ChangeNotifierProvider(
      create: (context) => RegisterNotifier(),
      child: GradientContainer(
        children: [
          Consumer<RegisterNotifier>(
            builder: (context, notifier, _) => Column(
              children: [
                CustomTextField(
                  onChanged: notifier.onChangeNickname,
                  label: "Nombre de usuario",
                  spacerHeight: 30,
                ),
                QuantitySelector(
                  onDecrement: notifier.onDecrement, 
                  onIncrement: notifier.onIncrement, 
                  label: "Edad", 
                  value: notifier.age
                ),
                SizedBox(height: 30),
                CustomRadioButton<String>(
                  label: "Sexo",
                  selectedValue: notifier.sex,
                  group: "Sexo",
                  options: [
                    Option<String>(
                      label: "H", 
                      value: "H"
                    ),
                    Option<String>(
                      label: "M", 
                      value: "M",
                    ),
                    Option<String>(
                      label: "NB", 
                      value: "NB",
                    ),
                    Option<String>(
                      label: "O", 
                      value: "O",
                    )
                  ], 
                  onChanged: notifier.onChangeSex
                ),
                SizedBox(height: 30),
                CustomSwitch(
                  label: "Cuenta publica", 
                  value: notifier.public, 
                  onChanged: notifier.onChangePublic
                ),
                SizedBox(height: 30),
                CustomTextField(
                  onChanged: notifier.onChangeEmail, 
                  label: "Correo electronico",
                  spacerHeight: 30,
                ),
                PasswordTextField(
                  onChanged: notifier.onChangePassword, 
                  changeShowPassword: notifier.onChangeShowPassword, 
                  showPassword: notifier.showPassword,
                  spacerHeight: 80,
                ),
                CustomButton(
                  text: "Registrarse",
                  maxSize: true,
                  onPressed: notifier.onRegister
                )
              ],
            )
          )
          
        ]
      ),
    );    
  }
}