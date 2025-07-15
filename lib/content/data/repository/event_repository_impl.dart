import 'package:injectable/injectable.dart';
import 'package:narramap/content/data/dto/new_event_dto.dart';
import 'package:narramap/content/domain/model/event.dart';
import 'package:narramap/content/domain/repository/i_event_repository.dart';
import 'package:narramap/core/network/dio_client.dart';
import 'package:narramap/shared/data/inteceptors/api_response_interceptor.dart';

@Injectable()
class EventRepositoryImpl extends IEventRepository {
  @override
  Future<List<Event>?> getAllEvents(String? token) async {
    final events = await DioClient.get(
      path: 'eventsapi-production.up.railway.app/events',
      fromJsonT:
          (json) => ApiResponseInterceptor.fromJson(
            json,
            (data) =>
                (data as List<dynamic>)
                    .map(
                      (eventJson) =>
                          Event.fromJson(eventJson as Map<String, dynamic>),
                    )
                    .toList(),
          ),
    );
    return events?.data;
  }

  @override
  Future<Event?> addEvent(String? token, NewEventDTO eventDto) async {
    final formData = await eventDto.toFormData();

    final event = await DioClient.postMultipart(
      path: 'eventsapi-production.up.railway.app/events',
      formData: formData,
      token: token!,
      fromJsonT:
          (json) => ApiResponseInterceptor.fromJson(
            json,
            (json) => Event.fromJson(json as Map<String, dynamic>),
          ),
    );

    return event?.data;
  }
}
