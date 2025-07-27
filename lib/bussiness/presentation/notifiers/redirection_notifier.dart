
import 'package:flutter/widgets.dart';
import 'package:narramap/bussiness/domain/model/bussiness.dart';
import 'package:narramap/bussiness/domain/use_cases/get_bussiness_use_case.dart';
import 'package:narramap/core/DI/get_it_config.dart';
import 'package:narramap/core/storage/secure_storage.dart';
import 'package:narramap/users/domain/model/user_profile.dart';
import 'package:narramap/users/domain/use_cases/get_user_profile_use_case.dart';


class RedirectionNotifier extends ChangeNotifier {

  final _getBussinessUseCase = getIt<GetBussinessUseCase>();
  final _getUserProfile = getIt<GetUserProfileUseCase>();
  
  Bussiness? _bussiness;
  Bussiness? get bussiness => _bussiness;

  UserProfile? _ownerProfile;
  UserProfile? get ownerProfile => _ownerProfile;

  Future<void> getBussinessByUserId() async {

    final res = await _getBussinessUseCase.run();
    print("-"*30);
    print(res);
    print("-"*30);

    if(res != null) {
      _bussiness = res;
    }
  }

}