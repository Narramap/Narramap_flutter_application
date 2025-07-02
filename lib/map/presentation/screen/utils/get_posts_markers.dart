
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:narramap/map/domain/model/post.dart';

List<Marker> getPostsMarkers(List<Post> posts) {
  return posts.map(
    (post) => Marker(
    point: post.coordinates, 
    child: Icon(
        Icons.circle,
        color: post.emotion.color,
        size: 10,
      )
    )
  ).toList();
}