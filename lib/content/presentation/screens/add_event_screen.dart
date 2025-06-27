
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:narramap/content/presentation/notifiers/add_event_notifier.dart';
import 'package:narramap/core/layout/white_container.dart';
import 'package:narramap/core/widgets/custom_button.dart';
import 'package:narramap/core/widgets/custom_text_field.dart';
import 'package:narramap/core/widgets/date_picker.dart';
import 'package:narramap/core/widgets/ubication_selector.dart';
import 'package:provider/provider.dart';

class AddEventScreen extends StatelessWidget {
  const AddEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddEventNotifier(),
      child: Consumer<AddEventNotifier>(
        builder: (context, notifier, _) => WhiteContainer(
          title: "Nuevo Evento",
          children: [
            CustomTextField(
              textFieldColor: TextFieldColors.gray,
              onChanged: notifier.onChangeTitle, 
              label: "Titulo",
              spacerHeight: 20,
            ),
            CustomTextField(
              textFieldColor: TextFieldColors.gray,
              onChanged: notifier.onChangeDescription, 
              label: "Descripcion",
              spacerHeight: 20,
              lines: 5,
              borderRadius: 15,
            ),
            UbicationSelector(
              label: "Ubicacion del Evento", 
              onSelectLocation: notifier.onSelectLocation,
            ),
            SizedBox(height: 20),
            DatePicker(
              label: "Fecha de Evento", 
              date: notifier.date, 
              onSelectDate: notifier.onSelectDate
            ),
            SizedBox(height: 20),

            CustomButton(
              text: "Cancelar",
              buttonColor: ButtonColors.gray, 
              onPressed: () => context.pop()
            ),
            CustomButton(
              text: "Guardar",
              onPressed: () {}
            )
          ]
        ),
      )
    );
  }
}