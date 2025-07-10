
import 'package:latlong2/latlong.dart';

class Event {
  final String id;
  final String userImage;
  final LatLng location;
  final int radius;
  final String title;
  final String description;
  final List<String> imageUrls;
  final DateTime date;
  final double initTime;
  final double endTime;

  Event({
    required this.id,
    required this.userImage,
    required this.location, 
    required this.radius,
    required this.title,
    required this.description,
    required this.imageUrls, 
    required this.date,
    required this.initTime, 
    required this.endTime
  });

}