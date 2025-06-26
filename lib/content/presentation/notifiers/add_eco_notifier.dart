
import 'package:flutter/material.dart';

class AddEcoNotifier extends ChangeNotifier{

  String _title = "";
  String get title => _title;

  String _description = "";
  String get description => _description;

  bool _public = true;
  bool get public => _public;

  bool _voiceRecorded = false;
  bool get voiceRecorded => _voiceRecorded;

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

  void saveEco(){
    
  }


}