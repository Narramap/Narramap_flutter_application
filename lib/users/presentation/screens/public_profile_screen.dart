import 'dart:io';

import 'package:flutter/material.dart';
import 'package:narramap/core/layout/stackable_scaffold.dart';
import 'package:narramap/core/layout/white_container.dart';
import 'package:narramap/shared/widgets/custom_button.dart';
import 'package:narramap/shared/widgets/custom_image_picker.dart';
import 'package:narramap/shared/widgets/custom_switch.dart';
import 'package:narramap/shared/widgets/custom_text_field.dart';
import 'package:narramap/users/domain/model/user_profile.dart';
import 'package:narramap/users/presentation/notifiers/public_profile_notifier.dart';
import 'package:narramap/users/presentation/widgets/conexions_container.dart';
import 'package:narramap/users/presentation/widgets/events_container.dart';
import 'package:narramap/users/presentation/widgets/phrases_container.dart';
import 'package:narramap/users/presentation/widgets/posts_container.dart';
import 'package:narramap/users/presentation/widgets/profile_photo_picker.dart';
import 'package:provider/provider.dart';

class PublicProfileScreen extends StatelessWidget {
  const PublicProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PublicProfileNotifier>(
      create: (_) => PublicProfileNotifier(),
      builder: (context, _) {
        final notifier = Provider.of<PublicProfileNotifier>(context, listen: false);

        return FutureBuilder(
          future: notifier.getUserProfile(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return WhiteContainer(
                children: [
                  const Center(child: CircularProgressIndicator()),
                ],
              );
            } else {

              return Consumer<PublicProfileNotifier>(
                builder: (context, notifier, _) {
                  UserProfile currentProfile = notifier.user!;
                  return StackableScaffold(
                    child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 150),
                      children: [
                        ProfilePhotoPicker(
                          defaultPhoto: currentProfile.user.imageUrl,
                          onSelectImage: notifier.onChangeProfilePhoto
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              currentProfile.user.nickname,
                              style: TextStyle(
                                color: TextColor.gray.textColor,
                                fontSize: 25,
                              ),
                            ),
                            IconButton(
                              onPressed: () {}, 
                              icon: Icon(
                                Icons.edit,
                                color: TextColor.gray.textColor,
                              ),
                            ),
                          ],
                        ),
                        
                        Text(
                          currentProfile.user.biography,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: TextColor.gray.textColor
                          ),
                        ),

                        CustomSwitch(
                          label: "Perfil publico", 
                          textColor: TextColor.gray,
                          value: true, 
                          onChanged: (val){}
                        ),
                        SizedBox(height: 40),

                        ConexionsContainer(conexions: currentProfile.conexions),
                        SizedBox(height: 20),
                        PhrasesContainer(phrases: currentProfile.phrases),
                        !notifier.addingPhrase ?
                          CustomButton(
                            buttonColor: ButtonColors.gray,
                            text: "Nueva Frase",
                            onPressed: notifier.toggleAddingPhrase,
                          )
                        :
                          Column(
                            spacing: 20,
                            children: [
                              CustomTextField(
                                onChanged: notifier.onChangeTextPhrase, 
                                label: "Frase",
                                textFieldColor: TextFieldColors.gray,
                              ),
                              CustomTextField(
                                onChanged: notifier.onChangeAuthor, 
                                label: "Autor (Opcional)",
                                textFieldColor: TextFieldColors.gray,
                              ),
                              CustomButton(
                                buttonColor: ButtonColors.gray,
                                text: "Cancelar",
                                onPressed: notifier.toggleAddingPhrase,
                              ),
                              CustomButton(
                                text: "Guardar",
                                onPressed: notifier.addPhrase,
                              )
                            ],
                          ),
                        SizedBox(height: 40),
                        PostsContainer(posts: currentProfile.posts),
                        SizedBox(height: 40),
                        EventsContainer(events: currentProfile.events),
                        SizedBox(height: 40),
              
                      ],
                    )
                  );
                },
              );
            }
          },
        );
      },
    );
  }
}
