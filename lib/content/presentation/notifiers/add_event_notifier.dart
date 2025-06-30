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
  }

  void onSelectDate(DateTime date) {
    _date = date;
  }
}