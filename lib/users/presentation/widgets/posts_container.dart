
import 'package:flutter/material.dart';
import 'package:narramap/shared/presentation/widgets/custom_switch.dart';
import 'package:narramap/shared/presentation/widgets/post_card.dart';
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
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 40,
      children: [
        Text(
          "Tus Ecos Publicados",
          style: TextStyle(
            fontSize: 20,
            color: TextColor.gray.textColor
          ),
        ),
        ...posts.map((post) => PostCard(post: post))
      ],
    );
  }
}