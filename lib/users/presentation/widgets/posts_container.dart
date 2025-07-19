
import 'package:flutter/material.dart';
import 'package:narramap/content/domain/model/post.dart';
import 'package:narramap/shared/presentation/widgets/custom_switch.dart';
import 'package:narramap/shared/presentation/widgets/post_card.dart';
import 'package:narramap/users/domain/model/user_profile.dart';

class PostsContainer extends StatelessWidget {

  final List<Post> posts;
  final UserProfile user;

  const PostsContainer({
    super.key,
    required this.posts,
    required this.user
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
        ...posts.map((post) => PostCard(post: post, user: user,))
      ],
    );
  }
}