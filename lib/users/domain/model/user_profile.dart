
import 'package:narramap/users/data/interceptors/user_interceptor.dart';

class UserProfile {

  final String id;
  final String nickname;
  final int age;
  final GenderInterceptorEnum gender;
  final bool isPublic;
  final bool bussiness;
  final String? biography;
  final String? profilePhoto;

  UserProfile({
    required this.id,
    required this.nickname,
    required this.age,
    required this.gender,
    required this.isPublic,
    required this.bussiness,
    required this.biography,
    required this.profilePhoto
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json["id"], 
      nickname: json["nickname"], 
      age: json["age"], 
      gender: GenderInterceptorEnum.fromString(json["gender"]), 
      isPublic: json["isPublic"], 
      bussiness: json["bussiness"], 
      biography: json["biography"], 
      profilePhoto: json["imageUrl"]
    );
  }
}