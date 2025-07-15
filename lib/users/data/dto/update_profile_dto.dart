
import 'package:narramap/users/data/interceptors/user_interceptor.dart';
import 'package:narramap/users/domain/model/user_profile.dart';

class UpdateProfileDTO {

  final UserProfile profile;
  final String? nickname;
  final String? biography;
  final int? age;
  final GenderInterceptorEnum? gender;
  final bool? public;
  final String? imageBase64;

  UpdateProfileDTO({
    required this.profile,
    this.nickname,
    this.biography,
    this.age,
    this.gender,
    this.public,
    this.imageBase64
  });

  bool isNotNull () {
    return nickname != null ||
      biography != null || 
      age != null || 
      gender != null || 
      public != null || 
      imageBase64 != null;
  }

  bool isDifferent() {
    return nickname != null && nickname != profile.nickname
      || biography != null && biography != profile.biography
      || age != null && age != profile.age
      || gender != null && gender != profile.gender
      || public != null && public != profile.isPublic
      || imageBase64 != null;
  }

  bool isUpdateable() {
    return isNotNull() && isDifferent();
  }

  Map<String, dynamic> toJsonMap() {
    return {
      "nickname" : nickname,
      "biography": biography,
      "age" : age,
      "gender" : gender?.label,
      "public" : public,
      "image_url" : imageBase64
    };
  }

}