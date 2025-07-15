
import 'package:injectable/injectable.dart';
import 'package:narramap/core/DI/get_it_config.dart';
import 'package:narramap/users/data/repository/user_repository.dart';
import 'package:narramap/users/domain/model/user_profile.dart';
import 'package:narramap/users/domain/repository/i_user_repository.dart';

@Injectable()
class GetUserProfileUseCase {

  final IUserRepository repository = getIt<UserRepository>();

  Future<UserProfile?> run(String userId, String token) async {
    return await repository.getUserProfile(userId, token);
  }
}