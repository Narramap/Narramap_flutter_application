import 'package:flutter/material.dart';
import 'package:narramap/map/data/repository/dummy_emotions_zones_repository.dart';
import 'package:narramap/map/data/repository/dummy_post_repository.dart';
import 'package:narramap/map/domain/model/emotions_zone.dart';
import 'package:narramap/map/domain/model/post.dart';

class MapNotifier extends ChangeNotifier{


  List<Post> _posts = [];
  List<Post> get posts => _posts;

  List<EmotionsZone> _emotionsZones = [];
  List<EmotionsZone> get emotionsZones => _emotionsZones;

  Future<void> getAll() async {
    await Future.wait([
      getPosts(),
      getEmotionsZones(),
    ]);
    print("fetch obtenidos--------------------------");
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