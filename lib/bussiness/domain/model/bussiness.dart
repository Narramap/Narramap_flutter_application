
import 'package:narramap/content/data/dto/new_post_dto.dart';
import 'package:narramap/shared/data/enum/bussiness_type_enum.dart';

class Bussiness {

  final String id;
  final String userId;
  final String name;
  final String description;
  final DateTime openTime;
  final DateTime closeTime;
  final LocationDTO location;
  final BussinessTypeEnum type;
  final List<String> workDays;
  final List<String> images;

  Bussiness({
    required this.id,
    required this.userId,
    required this.name,
    required this.description,
    required this.openTime, 
    required this.closeTime,
    required this.location,
    required this.type,
    required this.workDays,
    required this.images
  });

  factory Bussiness.fromJson(Map<String, dynamic> json) {
    return Bussiness(
      id: json["id"],
      userId: json["id_user"],
      name: json["name"], 
      description: json["description"], 
      openTime: json["open_time"], 
      closeTime: json["close_time"], 
      location: LocationDTO(
        latitude: json["location_lat"], 
        longitude: json["location_lon"]
      ), 
      type: BussinessTypeEnum.fromString(json["buss_type"]), 
      workDays: json["days"], 
      images: json["image_urls"]
    );
  }
}