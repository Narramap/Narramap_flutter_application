import 'dart:io';
import 'package:flutter/material.dart';
import 'package:narramap/content/presentation/notifiers/add_eco_notifier.dart';
import 'package:narramap/core/layout/white_container.dart';
import 'package:narramap/core/widgets/audio_record.dart';
import 'package:narramap/core/widgets/custom_button.dart';
import 'package:narramap/core/widgets/custom_image_picker.dart';
import 'package:narramap/core/widgets/custom_switch.dart';
import 'package:narramap/core/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class AddEcoScreen extends StatelessWidget {
  const AddEcoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddEcoNotifier(),
      child: Consumer<AddEcoNotifier>(
        builder: (context, notifier, _) => WhiteContainer(
          children: [
            CustomImagePicker(
              title: 'Añade una imagen', 
              onImageSelected: (File image) {}
            ),
            CustomTextField(
              onChanged: notifier.onChangeTitle, 
              label: "¿Sobre que reflexionaras?",
              spacerHeight: 20,
            ),
            CustomTextField(
              onChanged: notifier.onChangeDescription, 
              label: "¿Que estas pensando?",
              lines: 3,
              spacerHeight: 20,
            ),
            AudioRecord(
              onStop: (path) {
                print('Archivo guardado en: $path');
                // Aquí podrías reproducirlo o subirlo
              },
            ),
            CustomButton(
              text: "Grabar voz", 
              onPressed: () {},
              icon: Icons.audio_file,
              buttonColor: ButtonColors.gray,
            ),
            CustomSwitch(
              label: "Eco publico", 
              value: false, 
              onChanged: notifier.onTogglePublic,
            ),
            CustomButton(
              text: "Guardar",
              onPressed: notifier.saveEco
            )
          ]
        ),
      ) 
    );
  }
}