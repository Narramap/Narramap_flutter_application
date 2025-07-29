import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:narramap/bussiness/domain/model/bussiness.dart';
import 'package:narramap/bussiness/domain/use_cases/get_all_bussiness_use_case.dart';
import 'package:narramap/posts/data/dto/create_report_dto.dart';
import 'package:narramap/posts/domain/model/emotional_post.dart';
import 'package:narramap/events/domain/model/event.dart';
import 'package:narramap/posts/domain/model/post.dart';
import 'package:narramap/core/DI/get_it_config.dart';
import 'package:narramap/core/Location/location_service.dart';
import 'package:narramap/core/storage/secure_storage.dart';
import 'package:narramap/map/domain/model/layers_enum.dart';
import 'package:narramap/posts/domain/use_cases/get_all_emotional_posts_use_case.dart';
import 'package:narramap/events/domain/use_cases/get_all_events_use_case.dart';
import 'package:narramap/posts/domain/use_cases/get_all_posts_use_case.dart';
import 'package:narramap/posts/domain/use_cases/register_view_use_case.dart';
import 'package:narramap/posts/domain/use_cases/report_post_use_case.dart';

class MapNotifier extends ChangeNotifier{

  final GetAllPostsUseCase _getAllUseCase = getIt<GetAllPostsUseCase>();
  final GetAllEventsUseCase _getAllEvents = getIt<GetAllEventsUseCase>();
  final RegisterViewUseCase _registerPostViewUseCase = getIt<RegisterViewUseCase>();
  final ReportPostUseCase _reportUseCase = getIt<ReportPostUseCase>();
  final GetAllEmotionalPostsUseCase _getEmotinalPostsUseCase = getIt<GetAllEmotionalPostsUseCase>();
  final GetAllBussinessUseCase _getAllBussinessUseCase = getIt<GetAllBussinessUseCase>();

  LayersEnum _layer = LayersEnum.satelital;
  LayersEnum get layer => _layer;

  LatLng? _currentLocation;
  LatLng? get currentLocation => _currentLocation;

  List<Post> _posts = [];
  List<Post> get posts => _posts;

  List<EmotionalPost> _emotionalPosts = [];
  List<EmotionalPost> get emotionalPosts => _emotionalPosts;

  List<Event> _events = [];
  List<Event> get events => _events;


  List<Bussiness> _bussiness = [];
  List<Bussiness> get bussiness => _bussiness;

  void onChangeLayer(LayersEnum layer) {
    _layer = layer;
    notifyListeners();
  }

  Future<void> getAll() async {
    await Future.wait([
      getCurrentLocation(),
      getEmotionalPosts(),
      getEvents(),
      getAllBussiness(),
      
    ]);
    print("fetch obtenidos--------------------------");
  }

  Future<void> getCurrentLocation() async {

    final location = await LocationService().getCurrentLocation();
    _currentLocation = LatLng(location.latitude, location.longitude);
  }

  Future<void> getPosts() async {
    // _posts = await DummyPostRepository().getPosts();
    final postsRes = await _getAllUseCase.run();
    if(postsRes != null) {
      _posts = postsRes;
    }
  }

  Future<void> getEmotionalPosts() async {
    final emotionalPosts = await _getEmotinalPostsUseCase.run();
    if(emotionalPosts != null){
      _emotionalPosts = emotionalPosts;
    }
  }

  Future<void> getEvents() async {

    final token = await SecureStorage.getToken();
    final eventRes = await _getAllEvents.run(token!);
    if(eventRes != null) {
      _events = eventRes;
    }
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

  Future<void> getAllBussiness() async {
    final res = await _getAllBussinessUseCase.run();
    if(res != null) {
      _bussiness = res;
    }
  }
}