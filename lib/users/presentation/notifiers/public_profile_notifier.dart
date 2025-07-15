
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:narramap/core/DI/get_it_config.dart';
import 'package:narramap/core/storage/secure_storage.dart';
import 'package:narramap/users/domain/model/phrase.dart';
import 'package:narramap/users/domain/model/user_profile.dart';
import 'package:narramap/users/domain/use_cases/add_phrase_use_case.dart';
import 'package:narramap/users/domain/use_cases/get_phrases_use_case.dart';
import 'package:narramap/users/domain/use_cases/get_user_profile_use_case.dart';

class PublicProfileNotifier extends ChangeNotifier {

  final getProfileUseCase = getIt<GetUserProfileUseCase>();
  final getPhrasesUseCase = getIt<GetPhrasesUseCase>();
  final addPhraseUseCase = getIt<AddPhraseUseCase>();

  File? _newProfilePhoto;
  File? get newProfilePhoto => _newProfilePhoto;

  UserProfile? _user;
  UserProfile? get user => _user;

  List<Phrase> _phrases = [];
  List<Phrase> get phrases => _phrases;

  bool _addingPhrase = false;
  bool get addingPhrase => _addingPhrase;

  String _textPhrase = "";
  String get textPhrase => _textPhrase;

  String? _author;
  String? get author => _author;

  bool _editing = false;
  bool get editing => _editing;
  
  void toggleEditing() {
    _editing = !_editing;
    notifyListeners();
  }

  void toggleAddingPhrase() {
    _addingPhrase = !_addingPhrase;
    notifyListeners();
  }

  String onChangeTextPhrase(String value) {
    return _textPhrase = value;
  }

  String onChangeAuthor(String value) {
    return _author = value;
  }

  Future<void> getUserProfile() async {
    // _user = await userRepository.getUserProfile("token");
    final userId = await SecureStorage.getUserId();
    final token = await SecureStorage.getToken();

    final userProfile = await getProfileUseCase.run(userId!, token!);
    
    if(userProfile != null) {
      _user = userProfile;
    }
  }

  Future<void> getPhrases() async {

    final token = await SecureStorage.getToken();
    final phrases = await getPhrasesUseCase.run(token!);

    if(phrases != null) {
      _phrases = phrases;
    }
  }

  Future<void> addPhrase() async {

    final token = await SecureStorage.getToken();

    if(author != null){
      if(author!.isNotEmpty && textPhrase.isNotEmpty){
        final newPhrase = await addPhraseUseCase.run(
          token!, 
          Phrase(author: author!, text: textPhrase)
        );

        if(newPhrase != null) {
          _phrases.add(newPhrase);
          _phrases = _phrases;
          notifyListeners();
        }
      }
    }

  }

  void onChangeProfilePhoto(File photo) {
    _newProfilePhoto = photo;
  }

}