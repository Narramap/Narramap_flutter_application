
import 'package:injectable/injectable.dart';
import 'package:narramap/core/DI/get_it_config.dart';
import 'package:narramap/users/data/dto/update_profile_dto.dart';
import 'package:narramap/users/data/repository/user_repository.dart';
import 'package:narramap/users/domain/model/user_profile.dart';
import 'package:narramap/users/domain/repository/i_user_repository.dart';

@Injectable()
class UpdateProfileUseCase {

  final IUserRepository repository = getIt<UserRepository>();

  Future<UserProfile?> run (String token, UpdateProfileDTO updateDTO) async {

    return repository.updateUserProfile(token, updateDTO);
  }
}