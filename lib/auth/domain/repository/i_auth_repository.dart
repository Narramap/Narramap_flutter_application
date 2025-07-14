
import 'package:narramap/auth/data/dto/login_dto.dart';
import 'package:narramap/auth/data/dto/register_dto.dart';
import 'package:narramap/auth/data/interceptors/login_interceptor.dart';
import 'package:narramap/users/data/interceptors/user_interceptor.dart';

abstract class IAuthRepository {
  Future<LoginInterceptor?> login(LoginDto loginDto);
  Future<UserInterceptor?> register(RegisterDto registerDto);
}