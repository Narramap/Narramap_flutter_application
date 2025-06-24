
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:narramap/core/layout/gradient_container.dart';
import 'package:narramap/core/widgets/custom_button.dart';
import 'package:narramap/core/widgets/custom_checklist.dart';
import 'package:narramap/core/widgets/custom_radio_button.dart';
import 'package:narramap/core/widgets/custom_switch.dart';
import 'package:narramap/core/widgets/custom_text_field.dart';
import 'package:narramap/core/widgets/quantity_selector.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      children: [
        CustomTextField(
          onChanged: (value) {}, 
          label: "Nombre de usuario",
          spacerHeight: 30,
        ),
        QuantitySelector(
          onDecrement: () {}, 
          onIncrement: () {}, 
          label: "Edad", 
          value: 18
        ),
        SizedBox(height: 30),
        CustomRadioButton<String>(
          group: "Sexo",
          options: [
            Option<String>(
              label: "H", 
              value: "H"
            ),
            Option<String>(
              label: "M", 
              value: "M",
            )
          ], 
          onChanged: (value) {}
        ),
        SizedBox(height: 30),
        CustomSwitch(
          label: "Cuenta publica", 
          value: true, 
          onChanged: (value) {}
        ),
        SizedBox(height: 30),
        CustomTextField(
          onChanged: (value) {}, 
          label: "Correo electronico",
          spacerHeight: 30,
        ),
        CustomTextField(
          onChanged: (value) {}, 
          label: "Contrasena",
          spacerHeight: 40,
        ),
        CustomButton(
          text: "Registrarse",
          maxSize: true,
          onPressed: () {}
        )
      ]
    );    
  }
}