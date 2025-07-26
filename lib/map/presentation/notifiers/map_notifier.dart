import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:narramap/content/data/dto/create_report_dto.dart';
import 'package:narramap/content/data/dto/reaction_to_post_dto.dart';
import 'package:narramap/content/domain/model/event.dart';
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
import 'package:narramap/map/domain/use_cases/register_view_use_case.dart';
import 'package:narramap/map/domain/use_cases/report_post_use_case.dart';

class MapNotifier extends ChangeNotifier{

  final GetAllPostsUseCase _getAllUseCase = getIt<GetAllPostsUseCase>();
  final GetAllEventsUseCase _getAllEvents = getIt<GetAllEventsUseCase>();
  final RegisterViewUseCase _registerPostViewUseCase = getIt<RegisterViewUseCase>();
  final ReportPostUseCase _reportUseCase = getIt<ReportPostUseCase>();

  LayersEnum _layer = LayersEnum.satelital;
  LayersEnum get layer => _layer;

  LatLng? _currentLocation;
  LatLng? get currentLocation => _currentLocation;

  List<Post> _posts = [];
  List<Post> get posts => _posts;

  List<Event> _events = [];
  List<Event> get events => _events;

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
      getEvents(),
      getEmotionsZones(),
    ]);
    print("fetch obtenidos--------------------------");
  }

  Future<void> getCurrentLocation() async {

    final location = await LocationService().getCurrentLocation();
    _currentLocation = LatLng(location.latitude, location.longitude);
    notifyListeners();
  }

  Future<void> getPosts() async {
    // _posts = await DummyPostRepository().getPosts();
    final postsRes = await _getAllUseCase.run();
    if(postsRes != null) {
      _posts = postsRes;
    }
  }

  Future<void> getEvents() async {

    final token = await SecureStorage.getToken();
    final eventRes = await _getAllEvents.run(token!);
    if(eventRes != null) {
      _events = eventRes;
    }
    notifyListeners();
  }

  Future<void> getEmotionsZones() async {
    _emotionsZones = await DummyEmotionsZonesRepository().getAll();
    notifyListeners();
  }

  String _reason = "";
  String get reason => _reason;

  String onChangeReason(String value) {
    return _reason = value;
  }

  Future<void> registerPostView(String postId) async {
    final userId = await SecureStorage.getUserId();
    _registerPostViewUseCase.run(postId, userId!);
  }

  Future<void> reportPost(String postId, void Function() navigateBack) async {

    final userId = await SecureStorage.getUserId();
    final report = await _reportUseCase.run(
      postId, 
      CreateReportDto(
        userId: userId!, 
        reason: _reason
      )
    );

    if(report != null){
      navigateBack();
    }
  }
}