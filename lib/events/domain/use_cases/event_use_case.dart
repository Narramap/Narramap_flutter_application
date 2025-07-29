import 'package:injectable/injectable.dart';
import 'package:narramap/events/data/dto/new_event_dto.dart';
import 'package:narramap/events/data/repository/event_repository_impl.dart';
import 'package:narramap/events/domain/model/event.dart';
import 'package:narramap/events/domain/repository/i_event_repository.dart';
import 'package:narramap/core/storage/secure_storage.dart';

@Injectable()
class EventUseCase {
  IEventRepository repository = EventRepositoryImpl();

  Future<Event?> run(NewEventDTO newEvent) async {
    final token = await SecureStorage.getToken();
    return await repository.addEvent(token, newEvent);
  }
}
