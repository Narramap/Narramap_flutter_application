
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:narramap/content/domain/model/event.dart';
import 'package:narramap/content/domain/model/post.dart';
import 'package:narramap/core/DI/get_it_config.dart';
import 'package:narramap/core/storage/secure_storage.dart';
import 'package:narramap/users/data/dto/update_profile_dto.dart';
import 'package:narramap/users/domain/model/phrase.dart';
import 'package:narramap/users/domain/model/user_profile.dart';
import 'package:narramap/users/domain/use_cases/add_phrase_use_case.dart';
import 'package:narramap/users/domain/use_cases/delete_post_use_case.dart';
import 'package:narramap/users/domain/use_cases/get_phrases_use_case.dart';
import 'package:narramap/users/domain/use_cases/get_user_events_use_case.dart';
import 'package:narramap/users/domain/use_cases/get_user_posts_use_case.dart';
import 'package:narramap/users/domain/use_cases/get_user_profile_use_case.dart';
import 'package:narramap/users/domain/use_cases/update_profile_use_case.dart';

class PublicProfileNotifier extends ChangeNotifier {

  final getProfileUseCase = getIt<GetUserProfileUseCase>();
  final getPhrasesUseCase = getIt<GetPhrasesUseCase>();
  final addPhraseUseCase = getIt<AddPhraseUseCase>();
  final getUserPostsUseCase = getIt<GetUserPostsUseCase>();
  final updateProfileUseCase = getIt<UpdateProfileUseCase>();
  final getUserEventsUseCase = getIt<GetUserEventsUseCase>();
  final deletePostUseCase = getIt<DeletePostUseCase>();

  String? _specificUserId;

  File? _newProfilePhoto;
  File? get newProfilePhoto => _newProfilePhoto;

  UserProfile? _user;
  UserProfile? get user => _user;

  List<Phrase> _phrases = [];
  List<Phrase> get phrases => _phrases;

  List<Post> _userPosts = [];
  List<Post> get userPosts => _userPosts;

  List<Event> _userEvents = [];
  List<Event> get userEvents => _userEvents;

  bool _addingPhrase = false;
  bool get addingPhrase => _addingPhrase;

  String _textPhrase = "";
  String get textPhrase => _textPhrase;

  String? _author;
  String? get author => _author;

  bool _editing = false;
  bool get editing => _editing;

  String? _biography;
  String? get biography => _biography;

  String? _newNickname;
  String? get newNickname => _newNickname;

  bool? _public;
  bool? get public => _public;

  bool? _bussiness;
  bool? get bussiness => _bussiness;
  
  void toggleEditing() {
    _editing = !_editing;

    if(!_editing) {
      resetEditingValues();
    } else {
      _public = user!.isPublic;
      _bussiness = user!.bussiness;
      _newNickname = user!.nickname;
    }
    
    notifyListeners();
  }

  void toggleAddingPhrase() {
    _addingPhrase = !_addingPhrase;
    notifyListeners();
  }

  void togglePublic(bool value) {
    _public = value;
    notifyListeners();
  }

  void toggleBussiness(bool value) {
    _bussiness = value;
    notifyListeners();
  }

  String onChangeNickname(String value) {
    return _newNickname = value;
  }

  String onChangeTextPhrase(String value) {
    return _textPhrase = value;
  }

  String onChangeAuthor(String value) {
    return _author = value;
  }

  String onChangeBiography(String value) {
    return _biography = value;
  }

  void onChangeProfilePhoto(File photo) {
    _newProfilePhoto = photo;
  }

  Future<void> getAll({
    String? userId
  }) async {

    if(userId != null) {
      _specificUserId = userId;
    }

    await Future.wait([
      getUserProfile(),
      getPhrases(),
      getPostsByUserId(),
      getEventsByUserId()
    ]);
  }

  Future<void> getUserProfile() async {


    final userId = _specificUserId ?? await SecureStorage.getUserId();
    final token = await SecureStorage.getToken();

    final userProfile = await getProfileUseCase.run(userId!, token!);
    
    if(userProfile != null) {
      _user = userProfile;
    }
  }

  Future<void> getPhrases() async {

    final token = await SecureStorage.getToken();
    final userId = _specificUserId ?? await SecureStorage.getUserId();
    final phrases = await getPhrasesUseCase.run(token!, userId!);

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
          toggleAddingPhrase();
          notifyListeners();
        }
      }
    }
  }

  Future<void> getPostsByUserId() async {

    final userId = _specificUserId ?? await SecureStorage.getUserId();
    final userPosts = await getUserPostsUseCase.run(userId!);

    if(userPosts != null) {
      _userPosts = userPosts;
    }
  }

  Future<void> getEventsByUserId() async {

    final token = await SecureStorage.getToken();
    final events = await getUserEventsUseCase.run(token!);

    if(events != null) {
      _userEvents = events;
    }
  }

  Future<void> updateProfile() async { 

    MultipartFile? _photo;

    if(_newProfilePhoto != null) { 
      final fileName = _newProfilePhoto!.path.split('/').last;
      _photo = await MultipartFile.fromFile(_newProfilePhoto!.path, filename: fileName);
    }

    final updateDTO = UpdateProfileDTO(
      profile: user!,
      age: user!.age,
      gender: user!.gender,
      biography: _biography,
      newProfilePhoto: _photo,
      nickname: _newNickname,
      public: _public
    );

    final token = await SecureStorage.getToken();

    if(updateDTO.isUpdateable()) {
      final newUser = await updateProfileUseCase.run(token!, updateDTO);

      if(newUser != null) {
        _user = newUser;
        toggleEditing();
        notifyListeners();
      }
    } else {
      print("no hay cambios en el perfil");
    }
    
  }

  Future<void> deletePost(String postId) async {
    
    final deletedPostId = await deletePostUseCase.run(postId);

    if(deletedPostId != null) {
      final filtered = userPosts.where((post) => post.id != deletedPostId).toList();
      _userPosts = filtered;
      notifyListeners();
    }
  }

  void resetEditingValues() {
    _public = null;
    _bussiness = null;
    _newNickname = user!.nickname;
    _biography = user!.biography;
    _newProfilePhoto = null;
  }

  
}