
import 'package:flutter/material.dart';
import 'package:narramap/core/widgets/reactions_container.dart';
import 'package:narramap/map/domain/model/post.dart';

class PostCard extends StatelessWidget {

  final Post post;
  const PostCard({
    super.key,
    required this.post
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(post.userImage),
              radius: 20,
            ),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(post.title),
                Text(post.date.toString())
              ],
            )
          ],
        ),
        Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)
          ),          
          child: Image.network(
            post.postImages[0],
            fit: BoxFit.fill,
          ),
        ),
        Text(
          post.content,
          textAlign: TextAlign.justify,
        ),
        ReactionsContainer(
          reactions: post.reactions
        )
      ],
    );
  }
}