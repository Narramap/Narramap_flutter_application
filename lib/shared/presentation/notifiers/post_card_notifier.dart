
import 'package:flutter/widgets.dart';
import 'package:narramap/content/data/dto/reaction_to_post_dto.dart';
import 'package:narramap/content/domain/model/post.dart';
import 'package:narramap/content/domain/use_cases/react_to_post_use_case.dart';
import 'package:narramap/core/DI/get_it_config.dart';
import 'package:narramap/core/storage/secure_storage.dart';
import 'package:narramap/users/domain/use_cases/get_user_profile_use_case.dart';

class PostCardNotifier extends ChangeNotifier {

  final _getUserProfileUsecase = getIt<GetUserProfileUseCase>();
  final _reactToPostUseCase = getIt<ReactToPostUseCase>();

  Future<String?> getUserPhoto(String userId) async {

    final token = await SecureStorage.getToken();
    final profile = await _getUserProfileUsecase.run(userId, token!);

    return profile?.profilePhoto;
  }

  Future<Post?> reactToPost(ReactionToPostDTO reactionDTO) async {
    return await _reactToPostUseCase.run(reactionDTO);
  }


}