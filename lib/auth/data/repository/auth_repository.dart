import 'package:injectable/injectable.dart';
import 'package:narramap/auth/data/dto/login_dto.dart';
import 'package:narramap/auth/data/dto/register_dto.dart';
import 'package:narramap/auth/data/interceptors/login_interceptor.dart';
import 'package:narramap/auth/domain/repository/i_auth_repository.dart';
import 'package:narramap/core/network/dio_client.dart';
import 'package:narramap/users/data/interceptors/user_interceptor.dart';

@Injectable()
class AuthRepository extends IAuthRepository {

  @override
  Future<LoginInterceptor?> login(LoginDto loginDto) async {

    final user = await DioClient.post(
      path: "3001/auth/login", 
      body: loginDto.toJsonMap(), 
      fromJsonT: (json) => LoginInterceptor.fromJson(json)
    );
    
    return user;
  }

  @override
  Future<UserInterceptor?> register(RegisterDto registerDto) async {

    final user = await DioClient.post<UserInterceptor>(
      path: "3001/auth/register",
      body: registerDto.toJsonMap(), 
      fromJsonT: (json) => UserInterceptor.fromJson(json)
    );

    return user;
  }
}