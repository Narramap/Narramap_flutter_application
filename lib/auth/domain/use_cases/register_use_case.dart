import 'package:injectable/injectable.dart';
import 'package:narramap/auth/data/dto/register_dto.dart';
import 'package:narramap/auth/data/repository/auth_repository.dart';
import 'package:narramap/auth/domain/repository/i_auth_repository.dart';
import 'package:narramap/core/DI/get_it_config.dart';
import 'package:narramap/users/data/interceptors/user_interceptor.dart';

@Injectable()
class RegisterUseCase {

  final IAuthRepository repository = getIt<AuthRepository>();

  Future<UserInterceptor?> run(RegisterDto registerDTO) async {

    final user = await repository.register(registerDTO);

    return user;
  }
}