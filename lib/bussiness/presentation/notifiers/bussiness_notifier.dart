
import 'package:flutter/widgets.dart';
import 'package:narramap/bussiness/data/interceptors/rating_interceptor.dart';
import 'package:narramap/bussiness/domain/model/bussiness.dart';
import 'package:narramap/bussiness/domain/use_cases/get_average_rating_use_case.dart';
import 'package:narramap/bussiness/domain/use_cases/get_bussiness_by_id_use_case.dart';
import 'package:narramap/bussiness/domain/use_cases/get_bussiness_use_case.dart';
import 'package:narramap/bussiness/domain/use_cases/get_ratings_use_case.dart';
import 'package:narramap/core/DI/get_it_config.dart';
import 'package:narramap/core/storage/secure_storage.dart';
import 'package:narramap/users/domain/model/user_profile.dart';
import 'package:narramap/users/domain/use_cases/get_user_profile_use_case.dart';

class BussinessNotifier extends ChangeNotifier {

  final _getAverageRateUseCase = getIt<GetAverageRatingUseCase>();
  final _getUserProfileUseCase = getIt<GetUserProfileUseCase>();
  final _getRatesUseCase = getIt<GetRatingsUseCase>();
  final _getUserBussinessUseCase = getIt<GetBussinessUseCase>();
  final _getBussinessById = getIt<GetBussinessByIdUseCase>();


  Bussiness? _bussiness;
  Bussiness? get bussiness => _bussiness;

  double _averageRate = 0;
  double get averageRate => _averageRate;

  UserProfile? _ownerProfile;
  UserProfile? get ownerProfile => _ownerProfile;

  List<RatingInterceptor> _ratings = [];
  List<RatingInterceptor> get ratings => _ratings;
  
  bool _showRatings = false;
  bool get showRatings => _showRatings;

  void toggleShowRatings() {
    _showRatings = !showRatings;
  }

  Future<void> getAll(Bussiness? bussiness, String bussinessId) async {

    if(bussiness == null) {
      final res = await _getBussinessById.run(bussinessId);
      if(res != null) {
        _bussiness = res;
        bussiness = res;
      } else  {
        print("no se pudo obtener el negocio");
        return;
      }
    } else {
      _bussiness = bussiness;
    }

    await Future.wait([
      getAverageRate(bussiness.id),
      getOwnerProfile(bussiness.userId),
      getRates(bussiness.id)
    ]);

    notifyListeners();
  }

  Future<void> getBussinessById(String bussinessId) async {
    final res = await _getUserBussinessUseCase.run();
  }

  Future<void> getAverageRate(String bussinessId) async {
    final average = await _getAverageRateUseCase.run(bussinessId);
    if(average != null) {
      _averageRate = average;
    }
  }

  Future<void> getOwnerProfile(String ownerId) async {
    final token = await SecureStorage.getToken();
    final res = await _getUserProfileUseCase.run(ownerId, token!);
    if(res != null) {
      _ownerProfile = res;
    }
  }

  Future<void> getRates(String bussinessId) async {
    final res = await _getRatesUseCase.run(bussinessId);
    if(res != null) {
      _ratings = res;
    }
  }

  void setBusssiness(Bussiness value) {
    _bussiness = value;
    notifyListeners();
  }


}