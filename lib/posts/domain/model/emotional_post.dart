
import 'package:latlong2/latlong.dart';
import 'package:narramap/posts/data/dto/new_post_dto.dart';
import 'package:narramap/posts/data/interceptors/reaction_interceptor.dart';
import 'package:narramap/shared/data/enum/emotion_enum.dart';

class EmotionalPost {

  final String id;
  final String userId;
  final Emotions emotion;
  final DateTime date;
  final String title;
  final String content;
  final bool isPublic;
  final LatLng location;
  final List<String> images;
  final List<ReactionInterceptor> reactions;

  EmotionalPost({
    required this.id,
    required this.userId,
    required this.emotion,
    required this.title, 
    required this.date,
    required this.content, 
    required this.isPublic, 
    required this.location,
    required this.images, 
    required this.reactions
  });

  factory EmotionalPost.fromJson(Map<String, dynamic> json) {

    return EmotionalPost(
      id: json["id"], 
      userId: json["userId"], 
      emotion: Emotions.fromId(json["emotionId"]),
      date: DateTime.parse(json["date"]),
      title: json["title"], 
      content: json["content"], 
      isPublic: json["isPublic"], 
      location: LocationDTO.fromJson(json['location']).toLatLng(), 
      images: (json["imageUrls"] as List).map((e) => e as String).toList(),
      reactions: (json["reactions"] as List).map((reactionJson) => ReactionInterceptor.fromJson(reactionJson)).toList()
    );

  }
}