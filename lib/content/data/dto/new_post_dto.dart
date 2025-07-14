
import 'package:latlong2/latlong.dart';

class LocationDTO {

  final double latitude;
  final double longitude;

  LocationDTO({
    required this.latitude,
    required this.longitude
  });

  factory LocationDTO.fromJson(Map<String, dynamic> json) {
    return LocationDTO(
      latitude: json["latitude"], 
      longitude: json["longitude"]
    );
  }

  factory LocationDTO.fromLatLng(LatLng location) {
    return LocationDTO(
      latitude: location.latitude, 
      longitude: location.longitude
    );
  }

  Map<String, dynamic> toJsonMap () {
    return {
      "latitude": latitude,
      "longitude": longitude
    };
  }

  LatLng toLatLng() {
    return LatLng(latitude, longitude);
  }
}

class NewPostDTO {

  final String userId;
  final String title;
  final String content;
  final bool isPublic;
  final LocationDTO location;
  final List<String> images;

  NewPostDTO({
    required this.userId,
    required this.title,
    required this.content, 
    required this.isPublic,
    required this.location, 
    required this.images
  });

  Map<String, dynamic> toJsonMap() {
    return {
      "userId": userId,
      "title" : title,
      "content": content,
      "isPublic": isPublic,
      "location" : location.toJsonMap(),
      "images": images
    };
  }

}