
import 'package:flutter/material.dart';
import 'package:narramap/content/domain/model/post.dart';
import 'package:narramap/shared/presentation/widgets/card_header.dart';
import 'package:narramap/shared/presentation/widgets/custom_switch.dart';
import 'package:narramap/shared/presentation/widgets/reactions_container.dart';

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
          userImage: "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/e40b6ea6361a1abe28f32e7910f63b66/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg", 
          title: post.title, 
          date: post.date
        ),
        Text(
          post.content,
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: TextColor.gray.textColor
          ),
        ),
        if(post.images.isNotEmpty)
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
              ),          
              child: Image.network(
                post.images[0],
                fit: BoxFit.fill,
              ),
            ),
          ),
        
        ReactionsContainer(
          reactions: post.reactions
        )
      ],
    );
  }
}