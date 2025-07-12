
import 'package:flutter/material.dart';
import 'package:narramap/auth/data/dto/login_dto.dart';
import 'package:narramap/auth/data/repository/auth_repository.dart';
import 'package:narramap/auth/domain/repository/i_auth_repository.dart';
import 'package:narramap/shared/utils/validations.dart';

class LoginNotifier extends ChangeNotifier {

  IAuthRepository repository = AuthRepository();

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

  void onLogin() {
    
    if(!validateEmail(email)){
      _error = true;
      _errorMessage = "ingresa un correo valido";
      notifyListeners();
      return;
    }

    _error = false;
    notifyListeners();

    repository.login(LoginDto(email: email, password: password));
    

  }


}