
import 'package:narramap/auth/data/dto/login_dto.dart';
import 'package:narramap/auth/data/dto/register_dto.dart';
import 'package:narramap/users/domain/model/user.dart';

abstract class IAuthRepository {
  Future<User> login(LoginDto loginDto);
  Future<User> register(RegisterDto registerDto);
}