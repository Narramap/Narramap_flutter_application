
import 'package:injectable/injectable.dart';
import 'package:narramap/bussiness/data/interceptors/rating_interceptor.dart';
import 'package:narramap/bussiness/data/repository/bussiness_repository.dart';
import 'package:narramap/bussiness/domain/repository/i_bussiness_repository.dart';
import 'package:narramap/core/DI/get_it_config.dart';

@Injectable()
class GetRatingsUseCase {

  final IBussinessRepository _repository = getIt<BussinessRepository>();

  Future<List<RatingInterceptor>?> run(String bussinessId) async {
    return await _repository.getRates(bussinessId);
  }
}