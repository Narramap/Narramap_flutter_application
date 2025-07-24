
import 'package:flutter/material.dart';
import 'package:narramap/auth/data/dto/login_dto.dart';
import 'package:narramap/auth/domain/use_cases/login_use_case.dart';
import 'package:narramap/core/DI/get_it_config.dart';
import 'package:narramap/core/storage/secure_storage.dart';
import 'package:narramap/shared/utils/validations.dart';
import 'package:narramap/users/domain/model/user_profile.dart';
import 'package:narramap/users/domain/use_cases/get_user_profile_use_case.dart';

class LoginNotifier extends ChangeNotifier {

  LoginUseCase loginUseCase = getIt<LoginUseCase>();
  GetUserProfileUseCase getProfileUseCase = getIt<GetUserProfileUseCase>();

  bool _showPassword = false;
  bool get showPassword => _showPassword;

  String _email = "";
  String get email => _email;

  String _password = "";
  String get password => _password;

  bool _error = false;
  bool get error => _error;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  void getUserIdAndToken(void Function() navigateToHome) async {

    final userId = await SecureStorage.getUserId();
    final token = await SecureStorage.getToken();

    if(userId != null && token != null) {
      print("dentro del if");
      navigateToHome();
    } else {
      print("fuera del if");
    }
  }

  void onUpdateEmail(String email){
    _email = email;
    notifyListeners();
  }

  void onUpdatePassword(String pass) {
    _password = pass;
    notifyListeners();
  }

  void changeShowPassword() {
    _showPassword = !_showPassword;
    notifyListeners();
  }

  void onLogin(void Function() navigateToHome) async {
    
    if(!validateEmail(email)){
      _error = true;
      _errorMessage = "ingresa un correo valido";
      notifyListeners();
      return;
    }

    _error = false;
    notifyListeners();

    final loginResponse = await loginUseCase.run(LoginDto(email: email, password: password));


    if(loginResponse != null) {

      final userProfile = await getProfileUseCase.run(loginResponse.userId, loginResponse.token);

      SecureStorage.init();
      await SecureStorage.saveAuthData(loginResponse.token, loginResponse.userId);
      await SecureStorage.saveUserProfile(userProfile!);

      navigateToHome();
    } else {
      _error = true;
      _errorMessage = "credenciales incorrectas";
    }
  }
}