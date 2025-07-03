import 'package:flutter/material.dart';
import 'package:narramap/core/layout/white_container.dart';
import 'package:narramap/core/widgets/custom_button.dart';
import 'package:narramap/core/widgets/custom_text_field.dart';
import 'package:narramap/users/domain/model/user_profile.dart';
import 'package:narramap/users/presentation/notifiers/public_profile_notifier.dart';
import 'package:narramap/users/presentation/widgets/conexions_container.dart';
import 'package:narramap/users/presentation/widgets/phrases_container.dart';
import 'package:narramap/users/presentation/widgets/posts_container.dart';
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
                  return WhiteContainer(
                    spacing: 20,
                    lazyload: true,
                    children: [
                      CircleAvatar(
                        radius: 200,
                        backgroundImage: NetworkImage(notifier.user!.user.imageUrl),
                      ),
                      Row(
                        children: [
                          Text(
                            currentProfile.user.nickname,
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(height: 20),
                          IconButton(
                            onPressed: () {}, 
                            icon: Icon(Icons.edit),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                      Text(currentProfile.user.biography),
                      ConexionsContainer(conexions: currentProfile.conexions),
                      PhrasesContainer(phrases: currentProfile.phrases),
                      !notifier.addingPhrase ?
                        CustomButton(
                          buttonColor: ButtonColors.gray,
                          text: "Nueva Frase",
                          onPressed: notifier.toggleAddingPhrase,
                        )
                      :
                        Column(
                          children: [
                            CustomTextField(
                              onChanged: notifier.onChangeTextPhrase, 
                              label: "Frase"
                            ),
                            CustomTextField(
                              onChanged: notifier.onChangeAuthor, 
                              label: "Autor (Opcional)"
                            ),
                            CustomButton(
                              buttonColor: ButtonColors.gray,
                              text: "Cancelar",
                              onPressed: notifier.toggleAddingPhrase,
                            ),
                            CustomButton(
                              text: "Nueva Frase",
                              onPressed: notifier.addPhrase,
                            )
                          ],
                        ),
                  
                      PostsContainer(posts: currentProfile.posts)
                    ],
                  );
                },
                // child: WhiteContainer(
                //   spacing: 20,
                //   lazyload: true,
                //   children: [
                //     CircleAvatar(
                //       radius: 200,
                //       backgroundImage: NetworkImage(notifier.user!.user.imageUrl),
                //     ),
                //     Row(
                //       children: [
                //         Text(
                //           currentProfile.user.nickname,
                //           style: TextStyle(
                //             fontSize: 25,
                //           ),
                //         ),
                //         SizedBox(height: 20),
                //         IconButton(
                //           onPressed: () {}, 
                //           icon: Icon(Icons.edit),
                //         ),
                //         SizedBox(height: 20),
                //       ],
                //     ),
                //     Text(currentProfile.user.biography),
                //     ConexionsContainer(conexions: currentProfile.conexions),
                //     PhrasesContainer(phrases: currentProfile.phrases),
                //     !notifier.addingPhrase ?
                //       CustomButton(
                //         buttonColor: ButtonColors.gray,
                //         text: "Nueva Frase",
                //         onPressed: notifier.toggleAddingPhrase,
                //       )
                //     :
                //       Column(
                //         children: [
                //           CustomTextField(
                //             onChanged: notifier.onChangeTextPhrase, 
                //             label: "Frase"
                //           ),
                //           CustomTextField(
                //             onChanged: notifier.onChangeAuthor, 
                //             label: "Autor (Opcional)"
                //           ),
                //           CustomButton(
                //             buttonColor: ButtonColors.gray,
                //             text: "Cancelar",
                //             onPressed: notifier.toggleAddingPhrase,
                //           ),
                //           CustomButton(
                //             text: "Nueva Frase",
                //             onPressed: notifier.addPhrase,
                //           )
                //         ],
                //       ),
                
                //     PostsContainer(posts: currentProfile.posts)
                //   ],
                // ),
              );
            }
          },
        );
      },
    );
  }
}
