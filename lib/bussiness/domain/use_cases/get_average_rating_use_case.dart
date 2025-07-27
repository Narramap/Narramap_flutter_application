
import 'package:injectable/injectable.dart';
import 'package:narramap/bussiness/data/repository/bussiness_repository.dart';
import 'package:narramap/bussiness/domain/repository/i_bussiness_repository.dart';
import 'package:narramap/core/DI/get_it_config.dart';

@Injectable()
class GetAverageRatingUseCase {

  final IBussinessRepository _repository = getIt<BussinessRepository>();

  Future<double?> run(String bussinessId) async {
    return await _repository.getAverageRate(bussinessId);
  } 
}