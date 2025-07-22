import 'package:latlong2/latlong.dart';
import 'package:narramap/content/data/dto/new_post_dto.dart';
import 'package:narramap/shared/data/enum/events_enum.dart';

class Event {
  final String id;
  final String userId;
  final String title;
  final String description;
  final LatLng location;
  final double radius;
  final DateTime date;
  final String initTime;
  final String endTime;
  final EventEnum eventType;
  final List<String> imageUrls;

  Event({
    required this.id,
    required this.userId,
    required this.location,
    required this.radius,
    required this.title,
    required this.description,
    required this.date,
    required this.initTime,
    required this.endTime,
    required this.eventType,
    required this.imageUrls,
  });

  factory Event.fromJson(Map<String, dynamic> json) {

    print((json['location_lat'] as num).toDouble());
    print((json['location_lon'] as num).toDouble());
    print((json['radius'] as num).toDouble());
    return Event(
      id: json["id"],
      userId: json["id_user"],
      title: json["title"],
      description: json["description"],
      location:
          LocationDTO(
            latitude: (json['location_lat'] as num).toDouble(),
            longitude: (json['location_lon'] as num).toDouble(),
          ).toLatLng(),
      radius: (json['radius'] as num).toDouble(),
      date: DateTime.parse(json["date_event"]),
      initTime: json["start_time"],
      endTime: json["end_time"],
      eventType: EventEnum.fromString(json["event_type"]),
      imageUrls:
          (json["images"] as List).map((url) => url as String).toList(),
    );
  }
}
