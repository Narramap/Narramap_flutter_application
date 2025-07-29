
import 'package:flutter/widgets.dart';
import 'package:narramap/bussiness/data/interceptors/bussiness_prediction_interceptor.dart';
import 'package:narramap/bussiness/domain/use_cases/predict_bussiness_demand_use_case.dart';
import 'package:narramap/core/DI/get_it_config.dart';

class PredictionNotifier extends ChangeNotifier {

  final PredictBussinessDemandUseCase _predict = getIt<PredictBussinessDemandUseCase>();

  BussinessPredictionInterceptor? _prediction;
  BussinessPredictionInterceptor? get prediction => _prediction;

  bool? _getting;
  bool? get getting => _getting;

  Future<void> getBussinessPrediction(String bussinessId) async {

    _getting = true;
    notifyListeners();
    
    final res = await _predict.run(bussinessId);
    if(res != null) {
      _prediction = res;
    }

    _getting = false;
    notifyListeners();

  }
}