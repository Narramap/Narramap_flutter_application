
import 'package:narramap/map/domain/model/post.dart';
import 'package:narramap/shared/domain/model/reaction.dart';

class DetailedPost {

  final Post post;
  final List<Reaction> reactions;
  final List<String> images;

  DetailedPost({
    required this.post,
    required this.reactions,
    required this.images
  });

  factory DetailedPost.fromJson(Map<String, dynamic> json) {

    return DetailedPost(
      post: json["post"], 
      reactions: json["reactions"], 
      images: json["images"],
    );
  }
}