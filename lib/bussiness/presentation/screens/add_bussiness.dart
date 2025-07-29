
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:narramap/bussiness/presentation/notifiers/add_bussiness_notifier.dart';
import 'package:narramap/core/layout/white_container.dart';
import 'package:narramap/bussiness/domain/enum/bussiness_type_enum.dart';
import 'package:narramap/shared/presentation/widgets/buttons/custom_button.dart';
import 'package:narramap/shared/presentation/widgets/buttons/custom_checklist.dart';
import 'package:narramap/shared/presentation/widgets/buttons/custom_dropdown.dart';
import 'package:narramap/shared/presentation/widgets/inputs/custom_image_picker.dart';
import 'package:narramap/shared/presentation/widgets/buttons/custom_multiple_selector.dart';
import 'package:narramap/shared/presentation/widgets/inputs/custom_switch.dart';
import 'package:narramap/shared/presentation/widgets/inputs/custom_text_field.dart';
import 'package:narramap/shared/presentation/widgets/inputs/time_picker.dart';
import 'package:narramap/shared/presentation/widgets/inputs/ubication_selector.dart';
import 'package:provider/provider.dart';

class AddBussiness extends StatelessWidget {
  const AddBussiness({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddBussinessNotifier(),
      child: Consumer<AddBussinessNotifier>(
        builder: (context, notifier, _) => WhiteContainer(
          title: "Nuevo Comercio",
          lazyload: false,
          spacing: 20,
          children: [
            Text(
              "No tienes ningun negocio registrado, registra uno para comenzar",
              style: TextStyle(
                color: TextColor.gray.textColor
              ),
            ),
            CustomTextField(
              onChanged: notifier.onChangeName, 
              label: "Nombre",
              textFieldColor: TextFieldColors.gray,
            ),
            CustomTextField(
              onChanged: notifier.onChangeDescription, 
              label: "Descripcion",
              textFieldColor: TextFieldColors.gray,
            ),
            CustomDropdown<BussinessTypeEnum>(
              onChanged: notifier.onSelectBussinessType,
              options: BussinessTypeEnum.values
            ),
            UbicationSelector(
              heightMap: 300, 
              label: "Ubicacion", 
              onSelectLocation: notifier.onSelectLocation, 
              markers: [
                if(notifier.location != null)
                  Marker(
                    point: notifier.location!, 
                    child: Icon(
                      Icons.circle,
                      color: Colors.white,
                    )
                  )
              ], 
              circleMarkers: []
            ),
            TimePicker(
              label: "Hora de apertura", 
              selectedTime: notifier.openTime, 
              onTimeSelected: notifier.onSelectOpenTime
            ),
            TimePicker(
              label: "Hora de cierre", 
              selectedTime: notifier.closeTime, 
              onTimeSelected: notifier.onSelectCloseTime
            ),
            CustomMultipleSelector(
              label: "Dias de apertura", 
              options: [
                Option(label: "L", value: "LUNES"),
                Option(label: "M", value: "MARTES"),
                Option(label: "M", value: "MIERCOLES"),
                Option(label: "J", value: "JUEVES"),
                Option(label: "V", value: "VIERNES"),
                Option(label: "S", value: "SABADO"),
                Option(label: "D", value: "DOMINGO"),
              ], 
              selectedValues: notifier.activeDays, 
              onChanged: notifier.onSelectActiveDays
            ),
            CustomImagePicker(
              title: "Añade una imagen", 
              onImagesSelected: notifier.onSelectImages,
            ),
            SizedBox(height: 20),
            CustomButton(
              text: "Cancelar", 
              onPressed: context.pop,
              buttonColor: ButtonColors.gray,
            ),
            CustomButton(
              text: "Guardar", 
              onPressed: () {}
            ),
            SizedBox(height: 40)

          ],
        )
      ),
    );
  }
}