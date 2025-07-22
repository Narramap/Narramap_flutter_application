
import 'package:dio/dio.dart';
import 'package:narramap/users/data/interceptors/user_interceptor.dart';
import 'package:narramap/users/domain/model/user_profile.dart';

class UpdateProfileDTO {

  final UserProfile profile;
  final String? nickname;
  final String? biography;
  final int? age;
  final GenderInterceptorEnum? gender;
  final bool? public;
  final MultipartFile? newProfilePhoto;

  UpdateProfileDTO({
    required this.profile,
    this.nickname,
    this.biography,
    this.age,
    this.gender,
    this.public,
    this.newProfilePhoto
  });

  bool isNotNull () {
    return nickname != null ||
      biography != null || 
      age != null || 
      gender != null || 
      public != null || 
      newProfilePhoto != null;
  }

  bool isDifferent() {
    return nickname != null && nickname != profile.nickname
      || biography != null && biography != profile.biography
      || age != null && age != profile.age
      || gender != null && gender != profile.gender
      || public != null && public != profile.isPublic
      || newProfilePhoto != null;
  }

  bool isUpdateable() {
    return isNotNull() && isDifferent();
  }

  Map<String, dynamic> toJsonMap() {

    Map<String, dynamic> initalJsonMap = {
      "nickname" : nickname,
      "biography": biography,
      "age" : age,
      "gender" : gender?.label,
      "public" : public,
    };

    if(newProfilePhoto != null) {
      initalJsonMap["image_url"] = newProfilePhoto;

    }
    return initalJsonMap;
  }

  FormData toFormData() {
    final formData = FormData();
    print(public);

    if(nickname != null) {
      formData.fields.add(MapEntry("nickname", nickname!));
    }

    if(biography != null) {
      formData.fields.add(MapEntry("biography", biography!));
    }

    if(age != null) {
      formData.fields.add(MapEntry("age", age!.toString()));
    }

    if(gender != null) {
      formData.fields.add(MapEntry("gender", gender!.label));
    }

    if(public != null) {
      formData.fields.add(MapEntry("public", public!.toString()));
    }

    if(newProfilePhoto !=null) {
      formData.files.add(MapEntry<String, MultipartFile> ("image_url", newProfilePhoto!));
    }

    return formData;
  }

}