import 'package:narramap/auth/data/dto/register_dto.dart';
import 'package:narramap/auth/data/repository/auth_repository.dart';
import 'package:narramap/auth/domain/repository/i_auth_repository.dart';
import 'package:narramap/users/data/interceptors/user_interceptor.dart';

class RegisterUseCase {

  final IAuthRepository repository = AuthRepository();

  Future<UserInterceptor?> run(RegisterDto registerDTO) async {

    final user = await repository.register(registerDTO);

    return user;
  }
}