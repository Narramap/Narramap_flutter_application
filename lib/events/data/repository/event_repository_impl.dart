import 'dart:convert';
import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:narramap/bussiness/data/interceptors/event_assistance_interceptor.dart';
import 'package:narramap/events/data/dto/new_event_dto.dart';
import 'package:narramap/events/domain/model/event.dart';
import 'package:narramap/events/domain/repository/i_event_repository.dart';
import 'package:narramap/core/network/dio_client.dart';
import 'package:narramap/shared/data/inteceptors/api_response_interceptor.dart';

@Injectable()
class EventRepositoryImpl extends IEventRepository {

  final url = "https://narramapeventsapi-production.up.railway.app";

  @override
  Future<List<Event>?> getAllByUserId(String userId) async {

    final events = await DioClient.get(
      path: '$url/events/profile/$userId',
      fromJsonT: (data) => (data as List<dynamic>).map(
          (eventJson) => Event.fromJson(eventJson as Map<String, dynamic>),
        ).toList(),
    );
    return events;
  }

  @override
  Future<Event?> addEvent(String? token, NewEventDTO eventDto) async {
    final formData = await eventDto.toFormData();

    final event = await DioClient.postMultipart(
      path: '$url/events',
      formData: formData,
      token: token!,
      fromJsonT: (json) => Event.fromJson(json as Map<String, dynamic>),
    );

    return event;
  }

  @override
  Future<List<Event>?> getAllEvents(String token) async {

    DioClient.authToken = token;
    final events = await DioClient.get(
      path: "$url/events/all", 
      fromJsonT: (json) => (json as List<dynamic>).map(
        (eventJson) => Event.fromJson(eventJson as Map<String, dynamic>)
      ).toList()
    );

    return events;
  }

  @override
  Future<EventAssistanceInterceptor?> registerEventAssistency(String eventId) async {
    
    final eventAssistency = await DioClient.post(
      path: "$url/events/assistances/$eventId", 
      body: {}, 
      fromJsonT: (json) => EventAssistanceInterceptor.fromJson(json as Map<String, dynamic>)
    );

    return eventAssistency;
  }

  @override
  Future<List<EventAssistanceInterceptor>?> getEventAssistency(String eventId) async {
    final eventAssitencies = await DioClient.get(
      path: "$url/events/assistances/$eventId", 
      fromJsonT: (json) => (json as List<dynamic>).map(
        (assistencyJson) => EventAssistanceInterceptor.fromJson(assistencyJson as Map<String, dynamic>)
      ).toList()
    );
    return eventAssitencies;
  }
}
