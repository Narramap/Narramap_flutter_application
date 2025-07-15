
import 'package:injectable/injectable.dart';
import 'package:narramap/core/DI/get_it_config.dart';
import 'package:narramap/users/data/repository/user_repository.dart';
import 'package:narramap/users/domain/model/phrase.dart';
import 'package:narramap/users/domain/repository/i_user_repository.dart';

@Injectable()
class AddPhraseUseCase {

  final IUserRepository repository = getIt<UserRepository>();

  Future<Phrase?> run(String token, Phrase phrase) async {
    return await repository.addPhrase(token, phrase);
  }
}