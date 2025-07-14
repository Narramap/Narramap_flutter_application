
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:narramap/users/domain/model/user_profile.dart';

class PublicProfileNotifier extends ChangeNotifier {

  // final IUserRepository userRepository = DummyUserRepository();

  File? _newProfilePhoto;
  File? get newProfilePhoto => _newProfilePhoto;

  UserProfile? _user;
  UserProfile? get user => _user;

  bool _addingPhrase = false;
  bool get addingPhrase => _addingPhrase;

  String _textPhrase = "";
  String get textPhrase => _textPhrase;

  String? _author;
  String? get author => _author;

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
    notifyListeners();
  }

  Future<void> addPhrase() async {
    // await userRepository.addPhrase(
    //   "token",
    //   Phrase(
    //     author: _author!, 
    //     text: _textPhrase
    //   )
    // );
  }

  void onChangeProfilePhoto(File photo) {
    _newProfilePhoto = photo;
  }

}