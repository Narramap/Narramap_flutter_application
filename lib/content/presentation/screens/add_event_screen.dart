
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:narramap/content/presentation/notifiers/add_event_notifier.dart';
import 'package:narramap/core/layout/white_container.dart';
import 'package:narramap/shared/data/enum/events_enum.dart';
import 'package:narramap/shared/presentation/widgets/custom_button.dart';
import 'package:narramap/shared/presentation/widgets/custom_dropdown.dart';
import 'package:narramap/shared/presentation/widgets/custom_image_picker.dart';
import 'package:narramap/shared/presentation/widgets/custom_switch.dart';
import 'package:narramap/shared/presentation/widgets/custom_text_field.dart';
import 'package:narramap/shared/presentation/widgets/date_picker.dart';
import 'package:narramap/shared/presentation/widgets/quantity_selector.dart';
import 'package:narramap/shared/presentation/widgets/time_picker.dart';
import 'package:narramap/shared/presentation/widgets/ubication_selector.dart';
import 'package:provider/provider.dart';

class AddEventScreen extends StatelessWidget {
  const AddEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddEventNotifier(),
      child: Consumer<AddEventNotifier>(
        builder: (context, notifier, _) => WhiteContainer(
          lazyload: false,
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
              heightMap: 500,
              label: "Elija la ubicacion del Evento", 
              onSelectLocation: notifier.onSelectLocation,
              markers: [
                if(notifier.location != null)
                  Marker(
                  point: notifier.location!, 
                  child: Icon(
                    Icons.circle,  
                    color: const Color.fromARGB(255, 226, 226, 226),
                    size: 20,
                  )
                )
              ],
              circleMarkers: [
                if(notifier.location != null)
                  CircleMarker(
                    point: notifier.location!, 
                    radius: notifier.radius.toDouble(),
                    color: const Color.fromARGB(120, 219, 0, 0),
                    useRadiusInMeter: true
                  )
              ],
            ),
            SizedBox(height: 20),
            if(notifier.location != null) 
              QuantitySelector(
                onDecrement: notifier.onDecrementRadius, 
                onIncrement: notifier.onIncrementRadius, 
                label: "Radio del alcance del evento en metros", 
                value: notifier.radius,
                textColor: TextColor.gray,
              ),
            SizedBox(height: 20),
            DatePicker(
              label: "Fecha de Evento", 
              selectedDate: notifier.date, 
              onDateSelected: notifier.onSelectDate
            ),
            SizedBox(height: 20),
            TimePicker(
              label: "Hora de Inicio", 
              selectedTime: notifier.initTime, 
              onTimeSelected: notifier.onSelectInitTime
            ),
            SizedBox(height: 20),
            TimePicker(
              label: "Hora de Finalizacion", 
              selectedTime: notifier.endTime, 
              onTimeSelected: notifier.onSelectEndTime
            ),
            SizedBox(height: 20),
            CustomDropdown(options: EventEnum.values.map((enumS) => enumS.label).toList()),
            SizedBox(height: 20),
            
            CustomImagePicker(
              title: "Añade una imagen", 
              onImagesSelected: notifier.onImagesSelected
            ),

            SizedBox(height: 80),
            CustomButton(
              text: "Cancelar",
              buttonColor: ButtonColors.gray, 
              onPressed: () => context.pop(),
            ),
            SizedBox(height: 20),
            CustomButton(
              text: "Guardar",
              onPressed: () => notifier.saveEvent(context.pop)
            )
          ]
        ),
      )
    );
  }
}