import 'package:latlong2/latlong.dart';
import 'package:narramap/bussiness/domain/enum/bussiness_type_enum.dart';

class UpdateBussinessDTO {

  final String name;
  final String description;
  final String openTime;
  final String closeTime;
  final LatLng location;
  final BussinessTypeEnum bussType;
  final List<String> days;
  final List<String> imageUrls;

  UpdateBussinessDTO({
    required this.name,
    required this.description,
    required this.openTime,
    required this.closeTime,
    required this.location,
    required this.bussType,
    required this.days,
    required this.imageUrls,
  });

  Map<String, dynamic> toJsonMap() {
    return {
      "name": name,
      "description": description,
      "open_time": openTime,
      "close_time": closeTime,
      "location_lat": location.latitude,
      "location_lon": location.longitude,
      "buss_type": bussType.apiValue,
      "days": days,
      "image_urls": imageUrls,
    };
  }

  
}
