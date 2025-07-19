
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:narramap/users/domain/model/user_profile.dart';

class SecureStorage {

  static FlutterSecureStorage? _secureStorage;

  static FlutterSecureStorage getInstance() {

    if(_secureStorage == null) {
      _secureStorage = FlutterSecureStorage();
    }

    return _secureStorage!;
  }

  static void init(){
    if(_secureStorage == null){
      _secureStorage = FlutterSecureStorage();
    }
  }

  static Future<void> saveAuthData(String token, String userId) async {
    await _secureStorage!.write(key: 'token', value: token);
    await _secureStorage!.write(key: 'userId', value: userId);
  }

  static Future<String?> getToken() async => await _secureStorage!.read(key: 'token');
  static Future<String?> getUserId() async => await _secureStorage!.read(key: 'userId');

  static Future<void> saveUserProfile(UserProfile user) async {
    final jsonString = jsonEncode(user.toJson());
    await _secureStorage!.write(key: "userProfile", value: jsonString);
  } 

  static Future<UserProfile?> getUserProfile() async {
    final jsonString = await _secureStorage!.read(key: "userProfile");
    if(jsonString != null) {
      return UserProfile.fromJson(jsonDecode(jsonString));
    } else {
      return null;
    }
  }


  Future<void> clearAuthData() async => await _secureStorage!.deleteAll();

}