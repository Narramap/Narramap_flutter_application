
import 'package:narramap/map/domain/model/emotions_zone.dart';

abstract class EmotionsZonesRepository {

  Future<List<EmotionsZone>> getAll();
}