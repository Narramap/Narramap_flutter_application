
import 'package:latlong2/latlong.dart';
import 'package:narramap/content/data/dto/new_post_dto.dart';
import 'package:narramap/shared/data/enum/bussiness_type_enum.dart';

class RegisterBussinessDTO {

  final String name;
  final String description;
  final DateTime openTime;
  final DateTime closeTime;
  final LatLng location;
  final BussinessTypeEnum type;
  final List<String> workDays;
  final List<String> images;

  RegisterBussinessDTO({
    required this.name,
    required this.description,
    required this.openTime, 
    required this.closeTime,
    required this.location,
    required this.type,
    required this.workDays,
    required this.images
  });

  Map<String, dynamic> toJsonMap() => {
    "name" : name,
    "description" : description,
    "open_time" : "${openTime.hour}:${openTime.minute}",
    "close_time" : "${closeTime.hour}:${closeTime.minute}",
    "location_lat" : location.latitude,
    "location_lon" : location.longitude,
    "buss_type": type.label,
    "days" : workDays,
    "image_urls" : images
  };

  // factory RegisterBussinessDTO.fromJson(Map<String, dynamic> json) {
  //   return RegisterBussinessDTO(
  //     name: name, 
  //     description: description, 
  //     openTime: openTime, 
  //     closeTime: closeTime, 
  //     location: location, 
  //     type: type, workDays: 
  //     workDays, 
  //     images: images
  //     )
  // }

}