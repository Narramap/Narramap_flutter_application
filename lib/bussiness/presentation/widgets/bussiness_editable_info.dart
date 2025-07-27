import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:narramap/bussiness/domain/enum/week_days_enum.dart';
import 'package:narramap/bussiness/domain/model/bussiness.dart';
import 'package:narramap/bussiness/presentation/notifiers/bussiness_editable_notifier.dart';
import 'package:narramap/bussiness/presentation/widgets/service_time.dart';
import 'package:narramap/core/navigation/routes.dart';
import 'package:narramap/shared/data/enum/bussiness_type_enum.dart';
import 'package:narramap/shared/presentation/widgets/custom_checklist.dart';
import 'package:narramap/shared/presentation/widgets/custom_dropdown.dart';
import 'package:narramap/shared/presentation/widgets/custom_image_picker.dart';
import 'package:narramap/shared/presentation/widgets/custom_multiple_selector.dart';
import 'package:narramap/shared/presentation/widgets/custom_switch.dart';
import 'package:narramap/shared/presentation/widgets/custom_text_field.dart';
import 'package:narramap/shared/presentation/widgets/images_container.dart';
import 'package:narramap/shared/presentation/widgets/time_picker.dart';
import 'package:narramap/shared/presentation/widgets/ubication_selector.dart';
import 'package:narramap/users/domain/model/user_profile.dart';
import 'package:provider/provider.dart';

class BussinessEditableInfo extends StatelessWidget {

  final Bussiness bussiness;
  final bool editable;
  final UserProfile ownerProfile;
  final void Function(Bussiness) setBussiness;

  const BussinessEditableInfo({
    super.key,
    required this.setBussiness,
    required this.bussiness,
    required this.editable,
    required this.ownerProfile,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BussinessEditableNotifier(bussiness),
      builder: (context, child) => Consumer<BussinessEditableNotifier>(
        builder: (context, notifier, _) => Column(
          spacing: 20,
          children: [
            if(notifier.editing) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => notifier.saveChanges(setBussiness), 
                    icon: Icon(Icons.check)
                  ),
    
                  IconButton(
                    onPressed: notifier.toggleEditing,
                    icon: Icon(Icons.cancel_outlined)
                  ),
                  
                ],
              ),
              CustomTextField(
                onChanged: notifier.onChangeName, 
                label: "Nombre",
                defaultValue: bussiness.name,
                textFieldColor: TextFieldColors.gray,
              ),

              CustomTextField(
                onChanged: notifier.onChangeDescription,
                label: "Descripcion",
                defaultValue: bussiness.description,
                textFieldColor: TextFieldColors.gray,
              ),

              CustomDropdown<BussinessTypeEnum>(
                options: BussinessTypeEnum.values,
                onChanged: notifier.onChangeType
              ),

              CustomImagePicker(
                title: "Añadir una imagen", 
                onImagesSelected: notifier.onChangeImages
              ),

              TimePicker(
                label: "Hora de apertura", 
                selectedTime: notifier.openTime, 
                onTimeSelected: notifier.onChangeOpenTime
              ),

              TimePicker(
                label: "Hora de apertura", 
                selectedTime: notifier.closeTime, 
                onTimeSelected: notifier.onChangeCloseTime
              ),

              UbicationSelector(
                heightMap: 300, 
                label: "ubicacion del local", 
                onSelectLocation: notifier.onChangeLocation, 
                initialCenter: bussiness.location.toLatLng(),
                markers: [
                  Marker(
                    point: notifier.location, 
                    child: Icon(
                      Icons.store,
                      color: TextColor.gray.textColor,
                    )
                  )
                ], 
                circleMarkers: []
              ),
              
              CustomMultipleSelector<WeekDaysEnum>(
                label: "Dias de servicio", 
                options: WeekDaysEnum.values.map((day) => Option(label: day.label, value: day)).toList(), 
                selectedValues: notifier.activeDays, 
                onChanged: notifier.onChangeActiveDays
              )
              
            ]

            else ...[
              Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        bussiness.name,
                        style: TextStyle(
                          color: TextColor.gray.textColor,
                          fontSize: 30
                        ),
                      ),
            
                      if(editable)
                        IconButton(
                          onPressed: notifier.toggleEditing, 
                          icon: Icon(Icons.edit)
                        )              
                    ],
                  ),
                  Text(
                    bussiness.description,
                    style: TextStyle(
                      color: TextColor.gray.textColor,
                    ),
                  ),

                  SizedBox(),

                  Column(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Tipo de negocio",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: TextColor.gray.textColor,
                          fontSize: 17
                        ),
                      ),
                      Text(
                        bussiness.type.apiValue,
                        style: TextStyle(
                          color: TextColor.gray.textColor,
                          fontSize: 20
                        ),
                      ),
                    ],
                  ),

                  if(!editable)
                    GestureDetector(
                      onTap: () => context.go(Routes.someonePublicProfile.getParametredRoute([ownerProfile.id])),
                      child: Row(
                        spacing: 10,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: ownerProfile.profilePhoto != null ? 
                              NetworkImage(ownerProfile.profilePhoto!) 
                            : 
                              AssetImage("assets/images/default_profile_photo.webp")
                          ),

                          Text(
                            ownerProfile.nickname,
                            style: TextStyle(
                              color: TextColor.gray.textColor
                            ),
                          ),

                          
                        ],
                      ),
                  ),
                  

                  if(bussiness.images.isNotEmpty)
                    ImagesContainer(
                      images: bussiness.images
                    ),

                  SizedBox(),
                  ServiceTime(
                    openTime: bussiness.openTime, 
                    closeTime: bussiness.closeTime
                  ),

                  UbicationSelector(
                    heightMap: 300, 
                    label: "ubicacion del local", 
                    onSelectLocation: (value) {}, 
                    initialCenter: bussiness.location.toLatLng(),
                    markers: [
                      Marker(
                        point: bussiness.location.toLatLng(), 
                        child: Icon(
                          Icons.store,
                          color: TextColor.gray.textColor,
                        )
                      )
                    ], 
                    circleMarkers: []
                  ),

                  CustomMultipleSelector<WeekDaysEnum>(
                    label: "Dias de servicio", 
                    options: WeekDaysEnum.values.map((enumValue) => Option(label: enumValue.label, value: enumValue)).toList(), 
                    selectedValues: bussiness.workDays, 
                    onChanged: (_) {}
                  ),
                ],
              )
            ]
              
        
             
              
          ],
        ),
      )
    );
  }
}