
import 'package:flutter/material.dart';
import 'package:narramap/content/data/dto/reaction_to_post_dto.dart';
import 'package:narramap/content/domain/model/post.dart';
import 'package:narramap/shared/presentation/notifiers/post_card_notifier.dart';
import 'package:narramap/shared/presentation/widgets/card_header.dart';
import 'package:narramap/shared/presentation/widgets/custom_switch.dart';
import 'package:narramap/shared/presentation/widgets/reactions_container.dart';
import 'package:narramap/users/domain/model/user.dart';
import 'package:narramap/users/domain/model/user_profile.dart';
import 'package:provider/provider.dart';

class PostCard extends StatelessWidget {

  final Post post;
  final UserProfile? user;
  
  const PostCard({
    super.key,
    required this.post,
    this.user
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostCardNotifier(),
      child: Consumer<PostCardNotifier>(
        builder: (context, notifier, _) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            CardHeader(
              userImage: user?.profilePhoto,
              userId: post.userId,
              title: post.title,
              date: post.date,
              getImage: notifier.getUserPhoto,
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
              post: post,
              onTap: notifier.reactToPost,
            )
          ],
        ),
      ),
    );
  }
}