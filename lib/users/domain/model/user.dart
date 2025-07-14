
import 'package:narramap/shared/data/enum/sex_enum.dart';

class User {

  final String id;
  final String nickname;
  final String biography;
  final int age;
  final SexEnum sex;
  final String imageUrl;
  final bool publicProfile;
  final bool bussinessProfile;

  User({
    required this.id,
    required this.nickname,
    required this.biography,
    required this.age,
    required this.sex,
    required this.imageUrl,
    required this.publicProfile,
    required this.bussinessProfile
  });
  
}