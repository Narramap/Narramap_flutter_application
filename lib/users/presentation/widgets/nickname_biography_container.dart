

import 'package:flutter/material.dart';
import 'package:narramap/shared/presentation/widgets/inputs/custom_switch.dart';
import 'package:narramap/shared/presentation/widgets/inputs/custom_text_field.dart';

class NicknameBiographyContainer extends StatelessWidget {

  final bool editing;
  final String? userId;
  final void Function() updateProfile;
  final void Function() toggleEditing;
  final String Function(String) onChangeNickname;
  final String defaultNickname;
  final String? biography;
  final String Function(String) onChangeBiography;


  const NicknameBiographyContainer({
    super.key,
    required this.userId,
    required this.updateProfile,
    required this.toggleEditing,
    required this.editing,
    required this.onChangeNickname,
    required this.defaultNickname,
    required this.biography,
    required this.onChangeBiography
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        if(userId == null) 
          ...[
            editing ? 
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: updateProfile,
                    icon: Icon(
                      Icons.check,
                      color: TextColor.gray.textColor,
                    ),
                  ),
                  IconButton(
                    onPressed: toggleEditing,
                    icon: Icon(
                      Icons.cancel_outlined,
                      color: TextColor.gray.textColor,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              CustomTextField(
                onChanged: onChangeNickname, 
                label: "Nuevo nombre de usuario",
                defaultValue: defaultNickname,
                textFieldColor: TextFieldColors.gray,
              ),
            ],
          )
          :

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                defaultNickname,
                style: TextStyle(
                  color: TextColor.gray.textColor,
                  fontSize: 25,
                ),
              ),
              IconButton(
                onPressed: toggleEditing,
                icon: Icon(
                  Icons.edit,
                  color: TextColor.gray.textColor,
                ),
              )
            ]
          ),

          SizedBox(height: 20),
          !editing ?
            Text(
              biography ?? "Aun no has agregado tu biografia",
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: TextColor.gray.textColor
              ),
            )
          :
            CustomTextField(
              textFieldColor: TextFieldColors.gray,
              defaultValue: biography,
              onChanged:  onChangeBiography,
              label: "Biografia"
            ),
          ]
        else 
        ...[
          Text(
            defaultNickname,
            style: TextStyle(
              color: TextColor.gray.textColor,
              fontSize: 25,
            ),
          ),
          SizedBox(height: 20),
          Text(
            biography ?? "Este usuario aun no ha agregado nada a su biografia",
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: TextColor.gray.textColor
            ),
          )
        ],
        // editing ? 
        //   Column(
        //     children: [
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           IconButton(
        //             onPressed: updateProfile,
        //             icon: Icon(
        //               Icons.check,
        //               color: TextColor.gray.textColor,
        //             ),
        //           ),
        //           IconButton(
        //             onPressed: toggleEditing,
        //             icon: Icon(
        //               Icons.cancel_outlined,
        //               color: TextColor.gray.textColor,
        //             ),
        //           )
        //         ],
        //       ),
        //       SizedBox(height: 20),
        //       CustomTextField(
        //         onChanged: onChangeNickname, 
        //         label: "Nuevo nombre de usuario",
        //         defaultValue: defaultNickname,
        //         textFieldColor: TextFieldColors.gray,
        //       ),
        //     ],
        //   )
        //   :

        //   Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Text(
        //         defaultNickname,
        //         style: TextStyle(
        //           color: TextColor.gray.textColor,
        //           fontSize: 25,
        //         ),
        //       ),
        //       IconButton(
        //         onPressed: toggleEditing,
        //         icon: Icon(
        //           Icons.edit,
        //           color: TextColor.gray.textColor,
        //         ),
        //       )
        //     ]
        //   ),

        //   SizedBox(height: 20),
        //   !editing ?
        //     Text(
        //       biography ?? "Aun no has agregado tu biografia",
        //       textAlign: TextAlign.justify,
        //       style: TextStyle(
        //         color: TextColor.gray.textColor
        //       ),
        //     )
        //   :
        //     CustomTextField(
        //       textFieldColor: TextFieldColors.gray,
        //       defaultValue: biography,
        //       onChanged:  onChangeBiography,
        //       label: "Biografia"
        //     ),
      ],
    );
    
  }

}
