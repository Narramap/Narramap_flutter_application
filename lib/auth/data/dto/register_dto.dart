
import 'package:narramap/shared/enum/sex_enum.dart';

class RegisterDto {

  final String nickname;
  final String email;
  final int age;
  final String password;
  final SexEnum sex;
  final bool publicProfile;

  RegisterDto({
    required this.nickname,
    required this.email,
    required this.age,
    required this.password,
    required this.sex,
    required this.publicProfile
  });
}