
import 'package:flutter/material.dart';
import 'package:narramap/content/presentation/notifiers/add_event_notifier.dart';
import 'package:narramap/core/layout/white_container.dart';
import 'package:narramap/core/widgets/custom_text_field.dart';
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
              onChanged: onChanged, 
              label: "Titulo"
            )
          ]
        ),
      )
    );
  }
}