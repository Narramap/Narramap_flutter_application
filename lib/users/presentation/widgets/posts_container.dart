
import 'package:flutter/material.dart';
import 'package:narramap/core/widgets/post_card.dart';
import 'package:narramap/map/domain/model/post.dart';

class PostsContainer extends StatelessWidget {

  final List<Post> posts;
  const PostsContainer({
    super.key,
    required this.posts
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        Text("Tus Ecos Publicados"),
        ...posts.map((post) => PostCard(post: post))
      ],
    );
  }
}