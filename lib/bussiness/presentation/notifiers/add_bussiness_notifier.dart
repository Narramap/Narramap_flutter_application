
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class AddBussinessNotifier extends ChangeNotifier {

  String _name = "";
  String get name => _name;

  String _description = "";
  String get description => _description;

  String? _bussinessType;
  String? get bussinessType => _bussinessType;

  LatLng? _location;
  LatLng? get location => _location;

  DateTime? _openTime;
  DateTime? get openTime => _openTime;

  DateTime? _closeTime;
  DateTime? get closeTime => _closeTime;

  List<String> _activesDays = [];
  List<String> get activeDays => _activesDays;

  List<File>? _images;
  List<File>? get images => _images;

  String onChangeName(String value) {
    return _name = value;
  }

  String onChangeDescription(String value) {
    return _description = value;
  }

  void onSelectBussinessType(String? value){
    _bussinessType = value;
  }

  void onSelectLocation(LatLng value) {
    _location = value;
    notifyListeners();
  }

  void onSelectOpenTime(DateTime value) {
    _openTime = value;
    notifyListeners();
  }

  void onSelectCloseTime(DateTime value) {
    _closeTime = value;
    notifyListeners();
  }

  void onSelectImages(List<File> values) {
    _images = values;
  }

  void onSelectActiveDays(List<String> values) {
    _activesDays = values;
    notifyListeners();
  }

}