import 'package:flutter/foundation.dart';

enum GenderInterceptorEnum {

  masculine(label: "HOMBRE"),
  femenine(label: "MUJER"),
  nonBinary(label: "NO_BINARIO"),
  other(label: "OTRO");

  final String label;

  const GenderInterceptorEnum({
    required this.label
  });

  factory GenderInterceptorEnum.fromString(String value) {

    final genderEnumn = GenderInterceptorEnum.values.firstWhere((genderEnum) => genderEnum.label == value);
    return genderEnumn;

  }

}

class UserInterceptor {

  final String id;
  final String nickname;
  final String email;
  final int age;
  final GenderInterceptorEnum gender;
  final bool isPublic;
  final bool bussiness;

  UserInterceptor({
    required this.id,
    required this.nickname,
    required this.email,
    required this.age,
    required this.gender,
    required this.isPublic,
    required this.bussiness
  });

  factory UserInterceptor.fromJson(Map<String, dynamic> json) {

    return UserInterceptor(
      id: json["id"], 
      nickname: json["nickname"], 
      email: json["email"], 
      age: json["age"], 
      gender: json["gender"], 
      isPublic: json["isPublic"], 
      bussiness: json["business"]
    );
  }
}