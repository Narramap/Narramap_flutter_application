
import 'package:latlong2/latlong.dart';
import 'package:narramap/content/data/dto/new_post_dto.dart';
import 'package:narramap/content/data/interceptors/reaction_interceptor.dart';

class Post {

  final String id;
  final String userId;
  final DateTime date;
  final String title;
  final String content;
  final bool isPublic;
  final LatLng location;
  final List<String> images;
  final List<ReactionInterceptor> reactions;

  Post({
    required this.id,
    required this.userId,
    required this.title, 
    required this.date,
    required this.content, 
    required this.isPublic, 
    required this.location,
    required this.images, 
    required this.reactions
  });

  factory Post.fromJson(Map<String, dynamic> json) {

    print("-"*(100));
    print(json);
    print("-"*(100));

    return Post(
      id: json["id"], 
      userId: json["userId"], 
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