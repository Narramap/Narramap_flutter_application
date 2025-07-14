
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:narramap/content/domain/model/post.dart';
import 'package:narramap/map/domain/model/emotion_enum.dart';

List<Marker> getPostsMarkers(
  BuildContext context,
  List<Post> posts, 
  void Function(BuildContext context, Post post) showModal
) {
  return posts.map(
    (post) => Marker(
    point: post.location, 
    child: GestureDetector(
      onTap: () => showModal(context, post),
      child: Icon(
          Icons.circle,
          color: Emotions.happiness.color,
          size: 10,
        ),
    )

    )
  ).toList();
}