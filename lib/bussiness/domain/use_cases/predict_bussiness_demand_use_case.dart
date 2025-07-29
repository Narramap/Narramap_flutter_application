
import 'package:injectable/injectable.dart';
import 'package:narramap/bussiness/data/interceptors/bussiness_prediction_interceptor.dart';
import 'package:narramap/bussiness/data/repository/bussiness_model_prediction_repository.dart';
import 'package:narramap/bussiness/domain/repository/i_bussiness_model_prediction_repository.dart';
import 'package:narramap/core/DI/get_it_config.dart';

@Injectable()
class PredictBussinessDemandUseCase {
  
  final IBussinessModelPredictionRepository modelRepo = getIt<BussinessModelPredictionRepository>();

  Future<BussinessPredictionInterceptor?> run(String bussinessId) async {
    return await modelRepo.predictBussinessDemand(bussinessId);
  }
}