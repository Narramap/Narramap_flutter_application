import 'package:narramap/bussiness/data/interceptors/event_assistance_interceptor.dart';
import 'package:narramap/content/data/dto/new_event_dto.dart';
import 'package:narramap/content/domain/model/event.dart';

abstract class IEventRepository {
  Future<List<Event>?> getAllEvents(String token);
  Future<Event?> addEvent(String? token, NewEventDTO newEvent);
  Future<List<Event>?> getAllByUserId(String token);
  Future<EventAssistanceInterceptor?> registerEventAssistency(String eventId);
  Future<List<EventAssistanceInterceptor>?> getEventAssistency(String eventId);
}
