
import 'package:injectable/injectable.dart';
import 'package:narramap/bussiness/data/dto/register_bussiness_dto.dart';
import 'package:narramap/bussiness/data/repository/bussiness_repository.dart';
import 'package:narramap/bussiness/domain/model/bussiness.dart';
import 'package:narramap/bussiness/domain/repository/i_bussiness_repository.dart';
import 'package:narramap/core/DI/get_it_config.dart';

@Injectable()
class RegisterBussinessUseCase {

  final IBussinessRepository repository = getIt<BussinessRepository>();

  Future<Bussiness?> run(RegisterBussinessDTO registerDTO) async {
    return await repository.register(registerDTO);
  }
}