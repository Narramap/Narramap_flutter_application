
import 'package:injectable/injectable.dart';
import 'package:narramap/bussiness/data/repository/bussiness_repository.dart';
import 'package:narramap/bussiness/domain/model/bussiness.dart';
import 'package:narramap/bussiness/domain/repository/i_bussiness_repository.dart';
import 'package:narramap/core/DI/get_it_config.dart';

@Injectable()
class GetAllBussinessUseCase {

  final IBussinessRepository repository = getIt<BussinessRepository>();

  Future<List<Bussiness>?> run() async {
    return await repository.getAll();
  }
}