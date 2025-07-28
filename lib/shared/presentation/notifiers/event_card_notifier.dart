
import 'package:flutter/widgets.dart';
import 'package:narramap/bussiness/data/interceptors/event_assistance_interceptor.dart';
import 'package:narramap/content/domain/use_cases/confirm_event_assistency_use_case.dart';
import 'package:narramap/content/domain/use_cases/get_event_assistencies_use_case.dart';
import 'package:narramap/core/DI/get_it_config.dart';
import 'package:narramap/core/storage/secure_storage.dart';
import 'package:narramap/users/domain/use_cases/get_user_profile_use_case.dart';
import 'package:collection/collection.dart';

class EventCardNotifier extends ChangeNotifier {

  EventCardNotifier(String eventId) {
    getAssistencies(eventId);
  }

  final _getUserProfileUsecase = getIt<GetUserProfileUseCase>();
  final _registerEventAssistencyUseCase = getIt<ConfirmEventAssistencyUseCase>();
  final _getEventAssistanciesUseCase = getIt<GetEventAssistenciesUseCase>();

  List<EventAssistanceInterceptor> _assitancies = [];
  List<EventAssistanceInterceptor> get assistancies => _assitancies;

  bool _userAsisted = true;
  bool get userAsisted => _userAsisted;


  Future<String?> getUserPhoto(String userId) async {

    final token = await SecureStorage.getToken();
    final profile = await _getUserProfileUsecase.run(userId, token!);

    return profile?.profilePhoto;
  }

  Future<void> getAssistencies(String eventId) async {
    final res = await _getEventAssistanciesUseCase.run(eventId);
    if(res != null) {
      final userId = await SecureStorage.getUserId();
      _userAsisted = res.firstWhereOrNull((value) => value.userId == userId) != null;
      _assitancies = res;
    } else {
      _userAsisted = false;
    }

    notifyListeners();
  }

  Future<void> registerAssistency(String eventId) async {
    final res = await _registerEventAssistencyUseCase.run(eventId);
    if(res != null) {
      final assistencies = _assitancies;
      assistencies.add(res);
      _assitancies = assistencies;
      _userAsisted = true;
      notifyListeners();
    }
  }


}