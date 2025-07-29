
import 'package:flutter/material.dart';
import 'package:narramap/posts/domain/model/post.dart';
import 'package:narramap/shared/presentation/widgets/containers/card_header.dart';
import 'package:narramap/shared/presentation/widgets/inputs/custom_switch.dart';
import 'package:narramap/posts/presentation/widgets/post_card.dart';
import 'package:narramap/users/domain/model/user_profile.dart';

class PostsContainer extends StatelessWidget {

  final List<Post> posts;
  final UserProfile user;
  final Future<void> Function(String postId)? deletePost;

  const PostsContainer({
    super.key,
    required this.posts,
    required this.user,
    this.deletePost
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
        ListView.builder(
          itemCount: posts.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => PostCard(
            post: posts[index],
            user: user, 
            cornerAction: deletePost != null ? 
            CornerAction(
              icon: Icons.delete, 
              action: () => deletePost!(posts[index].id)
            )
            : null
          ),
          
        )
        // ...posts.map((post) => PostCard(
        //   post: post, 
        //   user: user, 
        //   cornerAction: deletePost != null ? 
        //   CornerAction(
        //     icon: Icons.delete, 
        //     action: () => deletePost!(post.id)
        //   )
        //   : null
        // ))
      ],
    );
  }
}