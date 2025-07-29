
import 'package:injectable/injectable.dart';
import 'package:narramap/bussiness/data/interceptors/bussiness_prediction_interceptor.dart';
import 'package:narramap/bussiness/domain/repository/i_bussiness_model_prediction_repository.dart';
import 'package:narramap/core/network/dio_client.dart';

@Injectable()
class BussinessModelPredictionRepository implements IBussinessModelPredictionRepository {

  final url = "http://34.192.37.128/prediction";


  @override
  Future<BussinessPredictionInterceptor?> predictBussinessDemand(String bussinessId) async {
    final now = DateTime.now();
    final res = await DioClient.get(
      path: "$url/$bussinessId?prediction_date=${now.year}-${now.month.toString().padLeft(2, "0")}-${now.day.toString().padLeft(2, "0")}",
      fromJsonT: (json) => BussinessPredictionInterceptor.fromJson(json)
    );
    return res;
  }


}
