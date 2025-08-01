import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:narramap/core/layout/stackable_scaffold.dart';
import 'package:narramap/core/layout/white_container.dart';
import 'package:narramap/shared/presentation/widgets/buttons/custom_button.dart';
import 'package:narramap/shared/presentation/widgets/inputs/custom_switch.dart';
import 'package:narramap/users/domain/model/user_profile.dart';
import 'package:narramap/users/presentation/notifiers/public_profile_notifier.dart';
import 'package:narramap/users/presentation/widgets/events_container.dart';
import 'package:narramap/users/presentation/widgets/nickname_biography_container.dart';
import 'package:narramap/users/presentation/widgets/phrases_container.dart';
import 'package:narramap/users/presentation/widgets/posts_container.dart';
import 'package:narramap/users/presentation/widgets/profile_photo_picker.dart';
import 'package:narramap/users/presentation/widgets/user_report_,modal.dart';
import 'package:provider/provider.dart';

class PublicProfileScreen extends StatelessWidget {

  final String? userId;

  const PublicProfileScreen({
    super.key,
    this.userId
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PublicProfileNotifier>(
      create: (context) => PublicProfileNotifier(),
      builder: (context, _) {
        final notifier = Provider.of<PublicProfileNotifier>(context, listen: false);

        return FutureBuilder(
          future: notifier.getAll(userId: userId),
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
                  UserProfile? currentProfile = notifier.user;
                  bool isUsersProfile = userId == null;
                  return StackableScaffold(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 130),
                        child: Column(
                          
                          children: [
                            if(currentProfile == null) ...[
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 170),
                                    child: Column(
                                      spacing: 20,
                                      children: [
                                        Icon(
                                          Icons.info,
                                          color: TextColor.gray.textColor,                                       
                                          size: 100,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20),
                                          child: Text(
                                            "Este usuario ha marcado su perfil como privado",
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              color: TextColor.gray.textColor
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                                
                              ]
                            
                            else if( currentProfile.isPublic || isUsersProfile) 
                              ...[
                                ProfilePhotoPicker(
                                  editing: notifier.editing,
                                  defaultPhoto: currentProfile.profilePhoto,
                                  onSelectImage: notifier.onChangeProfilePhoto
                                ),
                                SizedBox(height: 20),
                        
                                NicknameBiographyContainer(
                                  userId: userId,
                                  defaultNickname: currentProfile.nickname,
                                  toggleEditing: notifier.toggleEditing,
                                  updateProfile: notifier.updateProfile,
                                  editing: notifier.editing,
                                  onChangeNickname: notifier.onChangeNickname,
                                  biography: currentProfile.biography,
                                  onChangeBiography: notifier.onChangeBiography,
                                ),
                        
                                SizedBox(height: 20),
                        
                                if(!isUsersProfile)
                                  CustomButton(
                                    text: "Reportar este usuario", 
                                    onPressed: () => showUserReportModal(
                                      context: context, 
                                      onChangeReason: notifier.onChangeReason,
                                      registerReport: () => notifier.registerUserReport(currentProfile.id, context.pop)
                                    )
                                  ),
                        
                                SizedBox(height: 20),
                                
                        
                                if(userId == null)
                                  ...[
                                      CustomSwitch(
                                        label: "Perfil publico", 
                                        textColor: TextColor.gray,
                                        value: notifier.editing ? notifier.public! : currentProfile.isPublic, 
                                        onChanged: notifier.togglePublic
                                      ),
                                      SizedBox(height: 20),
                                      CustomSwitch(
                                        label: "Perfil de negocios",
                                        textColor: TextColor.gray,
                                        value: currentProfile.bussiness, 
                                        onChanged: notifier.toggleBussiness
                                      ),
                                      SizedBox(height: 40),
                                  ],
                                
                                // ConexionsContainer(conexions: currentProfile.conexions),
                                SizedBox(height: 20),
                                PhrasesContainer(
                                  userId: userId,
                                  phrases: notifier.phrases,
                                  addingPhrases: notifier.addingPhrase,
                                  onChangeAuthor: notifier.onChangeAuthor,
                                  onChangeTextPhrase: notifier.onChangeTextPhrase,
                                  savePhrase: notifier.addPhrase,
                                  toggleAddingPhrase: notifier.toggleAddingPhrase,
                                ),
                                SizedBox(height: 40),
                                PostsContainer(
                                  deletePost: userId != null ? null : notifier.deletePost,
                                  posts: notifier.userPosts,
                                  user: currentProfile,
                                ),
                                SizedBox(height: 40),
                                // if(userId == null)
                                  EventsContainer(
                                    events: notifier.userEvents,
                                    user: currentProfile
                                  ),
                                SizedBox(height: 40)
                              ]
                        
                            
                        
                              
                          ],
                        ),
                      ),
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
