
import 'package:latlong2/latlong.dart';
import 'package:narramap/map/domain/model/emotion_enum.dart';

class Post {

  final String id;
  final String userId;
  final String title;
  final String content;
  final LatLng coordinates;
  final Emotions emotion;

  Post({
    required this.id,
    required this.userId, 
    required this.title,
    required this.content,
    required this.coordinates,
    required this.emotion
  });
}