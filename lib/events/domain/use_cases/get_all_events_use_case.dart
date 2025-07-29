
import 'package:injectable/injectable.dart';
import 'package:narramap/events/data/repository/event_repository_impl.dart';
import 'package:narramap/events/domain/model/event.dart';
import 'package:narramap/events/domain/repository/i_event_repository.dart';
import 'package:narramap/core/DI/get_it_config.dart';

@Injectable()
class GetAllEventsUseCase {

  final IEventRepository repository = getIt<EventRepositoryImpl>();

  Future<List<Event>?> run(String token) async {
    return await repository.getAllEvents(token);
  }
}