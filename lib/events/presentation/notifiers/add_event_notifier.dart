import 'dart:io';

import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:narramap/events/data/dto/new_event_dto.dart';
import 'package:narramap/posts/data/dto/new_post_dto.dart';
import 'package:narramap/events/domain/use_cases/event_use_case.dart';
import 'package:narramap/core/Location/location_service.dart';
import 'package:narramap/core/storage/secure_storage.dart';
import 'package:narramap/events/domain/enum/events_enum.dart';

class AddEventNotifier extends ChangeNotifier {
  EventUseCase eventUseCase = EventUseCase();

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

  EventEnum? _eventType;
  EventEnum? get eventType => _eventType;

  List<File> _images = [];
  List<File> get images => _images;

  bool _error = false;
  bool get error => _error;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  void onIncrementRadius() {
    if (radius < 500) {
      _radius += 10;
      notifyListeners();
    }
  }

  void onDecrementRadius() {
    if (radius > 10) {
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

  void onChangeType(EventEnum eventType) {
    _eventType = eventType;
    notifyListeners();
    
  }

  void onImagesSelected(List<File> images) {
    _images = images;
  }

  void saveEvent(void Function() navigateBack) async {
    try {
      final location = await LocationService().getCurrentLocation();
      final userId = await SecureStorage.getUserId();

      final event = await eventUseCase.run(
        NewEventDTO(
          userId: userId!,
          title: _title,
          description: _description,
          location: LocationDTO(
            latitude: location.latitude,
            longitude: location.longitude,
          ),
          radius: _radius,
          date: _date!,
          initTime: _initTime!,
          endTime: _endTime!,
          eventType: _eventType!,
          imageUrls: _images,
        ),
      );

      if (event != null) {
        _error = false;
        notifyListeners();
        navigateBack();
      } else {
        _error = true;
        _errorMessage = "No se pudo registrar este evento";
        notifyListeners();
      }
    } catch (e) {
      print("Error al guardar evento: $e");
      _error = true;
      _errorMessage = "Ocurrió un error inesperado";
      notifyListeners();
    }
  }
}
