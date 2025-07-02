
import 'package:latlong2/latlong.dart';
import 'package:narramap/map/domain/model/emotion_enum.dart';
import 'package:narramap/map/domain/model/emotions_zone.dart';
import 'package:narramap/map/domain/repository/emotions_zones_repository.dart';

class DummyEmotionsZonesRepository extends EmotionsZonesRepository {

  @override
  Future<List<EmotionsZone>> getAll() async {
    
    return [
      EmotionsZone(
        location: LatLng(16.7350, -93.1010),
        radius: 120,
        emotion: Emotions.happiness,
      ),
      EmotionsZone(
        location: LatLng(16.7365, -93.0995),
        radius: 80,
        emotion: Emotions.serenity,
      ),
      EmotionsZone(
        location: LatLng(16.7370, -93.1000),
        radius: 150,
        emotion: Emotions.creativity,
      ),
      EmotionsZone(
        location: LatLng(16.7345, -93.1020),
        radius: 100,
        emotion: Emotions.rage,
      ),
      EmotionsZone(
        location: LatLng(16.7380, -93.1015),
        radius: 90,
        emotion: Emotions.love,
      ),
      EmotionsZone(
        location: LatLng(16.7360, -93.0980),
        radius: 110,
        emotion: Emotions.pain,
      ),
      EmotionsZone(
        location: LatLng(16.7330, -93.1000),
        radius: 130,
        emotion: Emotions.hope,
      ),
      EmotionsZone(
        location: LatLng(16.7358, -93.1030),
        radius: 70,
        emotion: Emotions.boring,
      ),
    ];
  }
}