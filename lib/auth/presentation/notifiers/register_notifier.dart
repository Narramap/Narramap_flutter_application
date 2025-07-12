import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:narramap/auth/data/dto/register_dto.dart';
import 'package:narramap/auth/domain/use_cases/register_use_case.dart';
import 'package:narramap/core/DI/get_it_config.dart';
import 'package:narramap/core/navigation/routes.dart';
import 'package:narramap/shared/enum/sex_enum.dart';
import 'package:narramap/shared/utils/validations.dart';

class RegisterNotifier extends ChangeNotifier{


  final RegisterUseCase registerUseCase = getIt<RegisterUseCase>();

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

  SexEnum? _sex;
  SexEnum? get sex => _sex;

  bool _bussinessProfile = false;
  bool get bussinessProfile => _bussinessProfile;

  bool _error = false;
  bool get error => _error;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  void onChangePublic(bool value) {
    _public = value;
    notifyListeners();
  }

  onChangeBussinessProfile(bool value) {
    _bussinessProfile = value;
    notifyListeners();
  }

  void onChangeSex(SexEnum? sex) {
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
    if(_age < 99) {
      _age += 1;
      notifyListeners();
    }
  }

  void onDecrement() {
    if(_age > 15) {
      _age -= 1;
      notifyListeners();
    }
  }

  void onRegister(void Function() navigateToHome) async {

    if(!validateEmail(email)){
      _error = true;
      _errorMessage = "ingresa un correo valido";
      notifyListeners();
      return;
    }

    if(!(_password.length >= 8 && _password.length <= 16)) {
      _error = true;
      _errorMessage = "La contraseña debe tener una longitud de 8 a 16 caracteres";
      notifyListeners();
      return;
    }

    if(_sex == null) {
      _error = true;
      _errorMessage = "Selecciona tu sexo";
      notifyListeners();
      return;
    }

    _error = false;
    notifyListeners();

    final user = await registerUseCase.run(RegisterDto(
      nickname: nickname, 
      email: email, 
      age: age, 
      password: password, 
      sex: sex!, 
      publicProfile: public,
      bussinessProfile: bussinessProfile
    ));

    if(user != null) {
      navigateToHome();
    }
  }
}