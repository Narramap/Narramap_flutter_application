

import 'package:flutter/material.dart';

class RegisterNotifier extends ChangeNotifier{

  String _nickaname = "";
  String get nickname => _nickaname;

  int _age = 18;
  int get age => _age;

  bool _public = true;
  bool get public => _public;

  bool _showPassword = false;
  bool get showPassword => _showPassword;

  String _email = "";
  String get email => _email;

  String _password = "";
  String get password => _password;

  String? _sex = null;
  String? get sex => _sex;

  void onChangePublic(bool value) {
    _public = value;
    notifyListeners();
  }

  void onChangeSex(String? sex) {
    if(sex != null) {
      _sex = sex;
      notifyListeners();
    }
  }

  String onChangeNickname(String nickname) {
    _nickaname = nickname;
    notifyListeners();
    return _nickaname;
  }

  String onChangeEmail(String email) {
    _email = email;
    notifyListeners();
    return email;
  }

  String onChangePassword(String pass) {
    _password = pass;
    notifyListeners();
    return _password;
  }

  void onChangeShowPassword() {
    _showPassword = !showPassword;
    notifyListeners();
  }

  void onIncrement() {
    _age += 1;
    notifyListeners();
  }

  void onDecrement() {
    if(_age != 15) {
      _age -= 1;
      notifyListeners();
    }
  }

  void onRegister() {

  }
}