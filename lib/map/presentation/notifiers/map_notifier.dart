import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:narramap/content/data/dto/reaction_to_post_dto.dart';
import 'package:narramap/content/domain/model/post.dart';
import 'package:narramap/content/domain/use_cases/react_to_post_use_case.dart';
import 'package:narramap/core/DI/get_it_config.dart';
import 'package:narramap/core/Location/location_service.dart';
import 'package:narramap/core/storage/secure_storage.dart';
import 'package:narramap/map/data/repository/dummy_emotions_zones_repository.dart';
import 'package:narramap/map/domain/model/emotions_zone.dart';
import 'package:narramap/map/domain/model/layers_enum.dart';
import 'package:narramap/map/domain/use_cases/get_all_events_use_case.dart';
import 'package:narramap/map/domain/use_cases/get_all_posts_use_case.dart';

class MapNotifier extends ChangeNotifier{

  final GetAllPostsUseCase getAllUseCase = getIt<GetAllPostsUseCase>();
  final ReactToPostUseCase reactUseCase = getIt<ReactToPostUseCase>();
  final GetAllEventsUseCase getAllEvents = getIt<GetAllEventsUseCase>();

  LayersEnum _layer = LayersEnum.satelital;
  LayersEnum get layer => _layer;

  LatLng? _currentLocation;
  LatLng? get currentLocation => _currentLocation;

  List<Post> _posts = [];
  List<Post> get posts => _posts;

  List<EmotionsZone> _emotionsZones = [];
  List<EmotionsZone> get emotionsZones => _emotionsZones;

  void onChangeLayer(LayersEnum layer) {
    _layer = layer;
    notifyListeners();
  }

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
    _currentLocation = LatLng(location.latitude, location.longitude);
    print("Ubicacion obtenida notifier $_currentLocation");
    notifyListeners();
  }

  Future<void> getPosts() async {
    // _posts = await DummyPostRepository().getPosts();
    final postsRes = await getAllUseCase.run();
    if(postsRes != null) {
      _posts = postsRes;
    }
    notifyListeners();
    print(SecureStorage.getToken());
  }

  Future<void> getEmotionsZones() async {
    _emotionsZones = await DummyEmotionsZonesRepository().getAll();
    notifyListeners();
  }
}