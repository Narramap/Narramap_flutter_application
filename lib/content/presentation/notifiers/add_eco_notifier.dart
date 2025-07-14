import 'dart:io';
import 'package:flutter/material.dart';
import 'package:narramap/content/data/dto/new_post_dto.dart';
import 'package:narramap/content/domain/use_cases/register_use_case.dart';
import 'package:narramap/core/DI/get_it_config.dart';
import 'package:narramap/core/Location/location_service.dart';

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
  }

  Future<List<String>> _getBase64Images() async {
    return await Future.wait(
      fileImages.map((fileImage) async => await fileImage.readAsBytes().toString())
    );
  }

  void saveEco(void Function() navigateBack) async {
    
    final location = await LocationService().getCurrentLocation();

    final post = await useCase.run(NewPostDTO(
      userId: "u1", 
      title: title, 
      content: description, 
      isPublic: public, 
      location: LocationDTO(latitude: location.latitude, longitude: location.longitude),
      images: await _getBase64Images()
    ));

    if(post != null) {
      _error = false;
      notifyListeners();
    } else {
      _error = true;
      _errorMessage = "No se pudo registrar este eco";
      notifyListeners();
    }


  }


}