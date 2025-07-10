
import 'package:flutter/material.dart';
import 'package:narramap/shared/widgets/card_header.dart';
import 'package:narramap/shared/widgets/custom_switch.dart';
import 'package:narramap/shared/widgets/reactions_container.dart';
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
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        CardHeader(
          userImage: post.userImage, 
          title: post.title, 
          date: post.date
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
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
        ),
        Text(
          post.content,
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: TextColor.gray.textColor
          ),
        ),
        ReactionsContainer(
          reactions: post.reactions
        )
      ],
    );
  }
}