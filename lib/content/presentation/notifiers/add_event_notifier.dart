import 'dart:io';

import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class AddEventNotifier extends ChangeNotifier {

  String _title = "";
  String get title => _title;

  String _description = "";
  String get description => _description;

  LatLng? _location;
  LatLng? get location => _location;

  DateTime? _date;
  DateTime? get date => _date;

  int _radius = 50;
  int get radius => _radius;

  DateTime? _initTime;
  DateTime? get initTime => _initTime;

  DateTime? _endTime;
  DateTime? get endTime => _endTime;

  List<File> _images = [];
  List<File> get images => _images;
  
  void onIncrementRadius() {
    if(radius < 500) {
      _radius += 10;
      notifyListeners();
    }
  }

  void onDecrementRadius() {
    if(radius > 10){
      _radius -= 10;
      notifyListeners();
    }
  }

  void onChangeTitle(String title) {
    _title = title;
    notifyListeners();
  }

  void onChangeDescription(String description) {
    _description = description;
    notifyListeners();
  }

  void onSelectLocation(LatLng location) {
    _location = location;
    notifyListeners();
  }

  void onSelectDate(DateTime date) {
    _date = date;
    notifyListeners();
  }

  void onSelectInitTime(DateTime time) {
    _initTime = time;
    notifyListeners();
  }

  void onSelectEndTime(DateTime time) {
    _endTime = time;
    notifyListeners();
  }

  void onImagesSelected(List<File> images) {
    _images = images;
  }
}