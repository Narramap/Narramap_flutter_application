
import 'package:flutter/widgets.dart';
import 'package:narramap/core/DI/get_it_config.dart';
import 'package:narramap/core/storage/secure_storage.dart';
import 'package:narramap/users/domain/model/user_profile.dart';
import 'package:narramap/users/domain/use_cases/get_user_profile_use_case.dart';

class RatingCardNotifier extends ChangeNotifier {

  final _getUserProfileUseCase = getIt<GetUserProfileUseCase>();

  UserProfile? _userProfile;
  UserProfile? get userProfile => _userProfile;

  Future<void> getUserProfile(String userId) async {
    final token = await SecureStorage.getToken();
    final res = await _getUserProfileUseCase.run(userId, token!);
    if(res != null) {
      _userProfile = res;
    }
  }
}