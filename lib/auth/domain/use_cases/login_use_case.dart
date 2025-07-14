
import 'package:injectable/injectable.dart';
import 'package:narramap/auth/data/dto/login_dto.dart';
import 'package:narramap/auth/data/interceptors/login_interceptor.dart';
import 'package:narramap/auth/data/repository/auth_repository.dart';
import 'package:narramap/auth/domain/repository/i_auth_repository.dart';
import 'package:narramap/core/DI/get_it_config.dart';

@Injectable()
class LoginUseCase {

  final IAuthRepository repository = getIt<AuthRepository>();

  Future<LoginInterceptor?> run(LoginDto loginDTO) async {

    return await repository.login(loginDTO);
  }
}