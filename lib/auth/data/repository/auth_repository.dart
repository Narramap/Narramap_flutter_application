
import 'package:narramap/auth/data/dto/login_dto.dart';
import 'package:narramap/auth/data/dto/register_dto.dart';
import 'package:narramap/auth/domain/repository/i_auth_repository.dart';
import 'package:narramap/users/domain/model/user.dart';

class AuthRepository extends IAuthRepository {

  @override
  Future<User> login(LoginDto loginDto) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<User> register(RegisterDto registerDto) {
    // TODO: implement register
    throw UnimplementedError();
  }
}