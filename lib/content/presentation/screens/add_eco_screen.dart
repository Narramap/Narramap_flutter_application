import 'package:flutter/material.dart';
import 'package:narramap/core/layout/white_container.dart';
import 'package:narramap/core/widgets/custom_button.dart';
import 'package:narramap/core/widgets/custom_switch.dart';
import 'package:narramap/core/widgets/custom_text_field.dart';

class AddEcoScreen extends StatelessWidget {
  const AddEcoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WhiteContainer(
      children: [
        
        CustomTextField(
          onChanged: (value) {}, 
          label: "Titulo",
          spacerHeight: 20,
        ),
        CustomTextField(
          onChanged: (value) {}, 
          label: "Descripcion",
          lines: 3,
          spacerHeight: 20,
        ),
        CustomButton(
          text: "Grabar voz", 
          onPressed: () {},
          icon: Icons.audio_file,
        ),
        CustomSwitch(
          label: "Eco publico", 
          value: false, 
          onChanged: (value) {},
        ),
        CustomButton(
          text: "Guardar", 
          onPressed: () {}
        )
      ]
    );
  }
}