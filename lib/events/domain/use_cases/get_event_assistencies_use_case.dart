
import 'package:injectable/injectable.dart';
import 'package:narramap/bussiness/data/interceptors/event_assistance_interceptor.dart';
import 'package:narramap/events/data/repository/event_repository_impl.dart';
import 'package:narramap/events/domain/repository/i_event_repository.dart';
import 'package:narramap/core/DI/get_it_config.dart';

@Injectable()
class GetEventAssistenciesUseCase {

  final IEventRepository _repository = getIt<EventRepositoryImpl>();

  Future<List<EventAssistanceInterceptor>?> run(String eventId) async {
    return await _repository.getEventAssistency(eventId);
  }
}