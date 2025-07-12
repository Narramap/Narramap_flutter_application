
import 'package:narramap/shared/enum/sex_enum.dart';

class RegisterDto {

  final String nickname;
  final String email;
  final int age;
  final String password;
  final SexEnum sex;
  final bool publicProfile;
  final bool bussinessProfile;

  RegisterDto({
    required this.nickname,
    required this.email,
    required this.age,
    required this.password,
    required this.sex,
    required this.publicProfile,
    required this.bussinessProfile
  });

  Map<String, dynamic> toJsonMap() {

    return {
      "nickname": nickname,
      "email": email,
      "password": password,
      "age": age,
      "gender": sex,
      "public": publicProfile,
      "bussiness": bussinessProfile
    };
  }
}