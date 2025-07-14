
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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

  Future<void> clearAuthData() async => await _secureStorage!.deleteAll();

}