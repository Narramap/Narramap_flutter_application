import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:narramap/content/data/dto/new_post_dto.dart';
import 'package:narramap/content/domain/use_cases/register_use_case.dart';
import 'package:narramap/core/DI/get_it_config.dart';
import 'package:narramap/core/Location/location_service.dart';
import 'package:narramap/core/storage/secure_storage.dart';

class AddEcoNotifier extends ChangeNotifier{

  RegisterUseCase useCase = getIt<RegisterUseCase>();

  String _title = "";
  String get title => _title;

  String _description = "";
  String get description => _description;

  bool _public = true;
  bool get public => _public;

  bool _voiceRecorded = false;
  bool get voiceRecorded => _voiceRecorded;

  List<File> _fileImages = [];
  List<File> get fileImages => _fileImages;

  bool _error = false;
  bool get error => _error;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  void onChangeTitle(String title) {
    _title = title;
    notifyListeners();
  }

  void onChangeDescription(String description) {
    _description = description;
    notifyListeners();
  }

  void onTogglePublic(bool value) {
    _public = value;
    notifyListeners();
  }

  void onToggleVoiceRecorded() {
    _voiceRecorded = !_voiceRecorded;
    notifyListeners();
  }

  void onChangeFileImages(List<File> images) {
    _fileImages = images;
    notifyListeners();
  }

  Future<List<String>> _getBase64Images() async {

    print(fileImages.length);

    return await Future.wait(_fileImages.map((file) async {
      final bytes = await file.readAsBytes();
      final extension = file.path.split('.').last.toLowerCase();

      // Detectar tipo MIME básico
      final mimeType = {
        'jpg': 'image/jpeg',
        'jpeg': 'image/jpeg',
        'png': 'image/png',
        'gif': 'image/gif',
        'webp': 'image/webp',
      }[extension] ?? 'application/octet-stream';

      final base64Str = base64Encode(bytes);
      return 'data:$mimeType;base64,$base64Str';
    }));
  }

  void saveEco(void Function() navigateBack) async {
    
    final location = await LocationService().getCurrentLocation();
    final userId = await SecureStorage.getUserId();

    final post = await useCase.run(NewPostDTO(
      userId: userId!, 
      title: title, 
      content: description, 
      isPublic: public, 
      location: LocationDTO(latitude: location.latitude, longitude: location.longitude),
      images: await _getBase64Images()
    ));

    if(post != null) {
      _error = false;
      notifyListeners();
      navigateBack();
    } else {
      _error = true;
      _errorMessage = "No se pudo registrar este eco";
      notifyListeners();
    }


  }


}