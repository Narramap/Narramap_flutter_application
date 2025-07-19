
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:narramap/core/network/dio_client.dart';
import 'package:narramap/users/data/dto/update_profile_dto.dart';
import 'package:narramap/users/domain/model/phrase.dart';
import 'package:narramap/users/domain/model/user_profile.dart';
import 'package:narramap/users/domain/repository/i_user_repository.dart';

@Injectable()
class UserRepository implements IUserRepository{

  final url = "https://narramapusersapi-production.up.railway.app";

  @override
  Future<UserProfile?> getUserProfile(String userId, String token) async {

    DioClient.authToken = token;
    
    final userRes = await DioClient.get(
      path: "$url/users/profile/$userId", 
      fromJsonT: (json) => UserProfile.fromJson(json as Map<String, dynamic>)
    );

    return userRes;
  }

  @override
  Future<List<Phrase>?> getPhrases(String token, String userId) async {

    DioClient.authToken = token;
    
    final phrasesRes = await DioClient.get(
      path: "$url/users/phrases/$userId", 
      fromJsonT: (json) => (json as List<dynamic>).map((jsonPhrase)  => Phrase.fromJson(jsonPhrase as Map<String, dynamic>)).toList()
    );

    return phrasesRes;
  }

  @override
  Future<Phrase?> addPhrase(String token, Phrase phrase) async {

    DioClient.authToken = token;

    final phraseRes = await DioClient.post(
      path: "$url/users/phrases", 
      body: phrase.toJsonMap(), 
      fromJsonT: (json) => Phrase.fromJson(json as Map<String, dynamic>)
    );

    return phraseRes;
  }

  @override
  Future<UserProfile?> updateUserProfile(String token, UpdateProfileDTO updateDTO) async {
    

    final updatedProfile = await DioClient.patchMultipart(
      path: "$url/users/profile", 
      body: updateDTO.toFormData(), 
      token: token,
      fromJsonT: (json) => UserProfile.fromJson(json as Map<String, dynamic>)
    );

    return updatedProfile;
  }
}