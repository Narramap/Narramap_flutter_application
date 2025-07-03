
import 'package:flutter/material.dart';

class LoginNotifier extends ChangeNotifier {

  bool _showPassword = false;
  bool get showPassword => _showPassword;

  String _email = "";
  String get email => _email;

  String _password = "";
  String get password => _password;

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


}