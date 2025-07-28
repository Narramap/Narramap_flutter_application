
import 'package:latlong2/latlong.dart';
import 'package:narramap/shared/data/enum/emotion_enum.dart';
import 'package:narramap/shared/domain/model/reaction.dart';

class Post {

  final String id;
  final List<String> postImages;
  final String userImage;
  final String userNickname;
  final String title;
  final String content;
  final LatLng coordinates;
  final Emotions emotion;
  final DateTime date;
  final List<Reaction> reactions;

  Post({
    required this.id,
    required this.postImages,
    required this.userImage, 
    required this.userNickname,
    required this.date,
    required this.title,
    required this.content,
    required this.coordinates,
    required this.emotion,
    required this.reactions
  });
}