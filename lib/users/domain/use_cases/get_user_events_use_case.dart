
import 'package:injectable/injectable.dart';
import 'package:narramap/content/data/repository/event_repository_impl.dart';
import 'package:narramap/content/domain/model/event.dart';
import 'package:narramap/content/domain/repository/i_event_repository.dart';
import 'package:narramap/core/DI/get_it_config.dart';

@Injectable()
class GetUserEventsUseCase {

  final IEventRepository repository = getIt<EventRepositoryImpl>();

  Future<List<Event>?> run(String token) async {
    return await repository.getAllByUserId(token);
  }
}