import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:narramap/core/Location/location_service.dart';
import 'package:narramap/map/data/repository/dummy_emotions_zones_repository.dart';
import 'package:narramap/map/data/repository/dummy_post_repository.dart';
import 'package:narramap/map/domain/model/emotions_zone.dart';
import 'package:narramap/map/domain/model/post.dart';

class MapNotifier extends ChangeNotifier{

  LatLng? _currentLocation;
  LatLng? get currentLocation => _currentLocation;

  List<Post> _posts = [];
  List<Post> get posts => _posts;

  List<EmotionsZone> _emotionsZones = [];
  List<EmotionsZone> get emotionsZones => _emotionsZones;

  Future<void> getAll() async {
    await Future.wait([
      getCurrentLocation(),
      getPosts(),
      getEmotionsZones(),
    ]);
    print("fetch obtenidos--------------------------");
  }

  Future<void> getCurrentLocation() async {

    final location = await LocationService().getCurrentLocation();
    _currentLocation = LatLng(location.latitude, location.latitude);
    notifyListeners();
  }

  Future<void> getPosts() async {
    _posts = await DummyPostRepository().getPosts();
    notifyListeners();
  }

  Future<void> getEmotionsZones() async {
    _emotionsZones = await DummyEmotionsZonesRepository().getAll();
    notifyListeners();
  }
}