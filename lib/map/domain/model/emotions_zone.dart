
import 'package:latlong2/latlong.dart';
import 'package:narramap/shared/data/enum/emotion_enum.dart';

class EmotionsZone {
  final LatLng location;
  final double radius;
  final Emotions emotion;

  EmotionsZone({
    required this.location,
    required this.radius,
    required this.emotion
  });
}