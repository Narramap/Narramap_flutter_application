import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:narramap/posts/presentation/notifiers/add_eco_notifier.dart';
import 'package:narramap/core/layout/white_container.dart';
import 'package:narramap/shared/presentation/widgets/buttons/custom_button.dart';
import 'package:narramap/shared/presentation/widgets/inputs/custom_image_picker.dart';
import 'package:narramap/shared/presentation/widgets/inputs/custom_switch.dart';
import 'package:narramap/shared/presentation/widgets/inputs/custom_text_field.dart';
import 'package:provider/provider.dart';

class AddEcoScreen extends StatelessWidget {
  const AddEcoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddEcoNotifier(),
      child: Consumer<AddEcoNotifier>(
        builder: (context, notifier, _) => WhiteContainer(
          
          title: "Nuevo Eco",
          children: [
            CustomImagePicker(
              title: 'Añade una imagen', 
              onImagesSelected: notifier.onChangeFileImages
            ),
            SizedBox(height: 20),
            CustomTextField(
              textFieldColor: TextFieldColors.gray,
              onChanged: notifier.onChangeTitle, 
              label: "¿Sobre que reflexionaras?",
              spacerHeight: 20,
            ),
            CustomTextField(
              textFieldColor: TextFieldColors.gray,
              onChanged: notifier.onChangeDescription, 
              label: "¿Que estas pensando?",
              lines: 5,
              spacerHeight: 20,
              borderRadius: 15,
            ),
          
            SizedBox(height: 20),
            CustomSwitch(
              label: "Eco publico", 
              value: notifier.public, 
              onChanged: notifier.onTogglePublic,
              textColor: TextColor.gray,
            ),
            SizedBox(height: 10),
            if(notifier.error)
              Text(
                notifier.errorMessage,
                style: TextStyle(
                  color: const Color.fromARGB(255, 156, 156, 156)
                ),
              ),
            SizedBox(height: 50),
            CustomButton(
              text: "Cancelar",
              onPressed: context.pop,
              buttonColor: ButtonColors.gray,
            ),
            SizedBox(height: 20),
            CustomButton(
              text: "Guardar",
              onPressed: () => notifier.saveEco(context.pop)
            )
          ]
        ),
      ) 
    );
  }
}