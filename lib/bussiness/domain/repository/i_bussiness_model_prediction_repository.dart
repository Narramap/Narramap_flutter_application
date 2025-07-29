
import 'package:narramap/bussiness/data/interceptors/bussiness_prediction_interceptor.dart';

abstract class IBussinessModelPredictionRepository {

  Future<BussinessPredictionInterceptor?> predictBussinessDemand(String bussinessId);
}