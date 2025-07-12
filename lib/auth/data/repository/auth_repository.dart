
import 'package:narramap/auth/data/dto/login_dto.dart';
import 'package:narramap/auth/data/dto/register_dto.dart';
import 'package:narramap/auth/domain/repository/i_auth_repository.dart';
import 'package:narramap/core/network/dio_client.dart';
import 'package:narramap/users/data/interceptors/user_interceptor.dart';
import 'package:narramap/users/domain/model/user.dart';

class AuthRepository extends IAuthRepository {

  @override
  Future<User?> login(LoginDto loginDto) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<UserInterceptor?> register(RegisterDto registerDto) async {

    final user = await DioClient.post<UserInterceptor>(
      path: "/pendiente",
      body: registerDto.toJsonMap(), 
      fromJsonT: (json) => UserInterceptor.fromJson(json)
    );

    return user;
  }
}