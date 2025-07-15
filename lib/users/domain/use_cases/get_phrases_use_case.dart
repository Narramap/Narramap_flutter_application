
import 'package:injectable/injectable.dart';
import 'package:narramap/core/DI/get_it_config.dart';
import 'package:narramap/users/data/repository/user_repository.dart';
import 'package:narramap/users/domain/model/phrase.dart';
import 'package:narramap/users/domain/repository/i_user_repository.dart';

@Injectable()
class GetPhrasesUseCase {

  final IUserRepository repository = getIt<UserRepository>(); 

  Future<List<Phrase>?> run(String token, String userId) async {

    return await repository.getPhrases(token, userId);
  }

}