
import 'package:flutter/material.dart';
import 'package:narramap/posts/domain/model/post.dart';
import 'package:narramap/posts/presentation/notifiers/post_card_notifier.dart';
import 'package:narramap/shared/presentation/widgets/containers/card_header.dart';
import 'package:narramap/comments/presentation/widgets/comments_container.dart';
import 'package:narramap/shared/presentation/widgets/inputs/custom_switch.dart';
import 'package:narramap/shared/presentation/widgets/containers/images_container.dart';
import 'package:narramap/shared/presentation/widgets/containers/reactions_container.dart';
import 'package:narramap/users/domain/model/user_profile.dart';
import 'package:provider/provider.dart';



class PostCard extends StatefulWidget {

  final Post post;
  final UserProfile? user;
  final CornerAction? cornerAction;
  
  const PostCard({
    super.key,
    required this.post,
    this.user,
    this.cornerAction,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostCardNotifier(widget.post.id),
      child: Consumer<PostCardNotifier>(
        builder: (context, notifier, _) {

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  CardHeader(
                    userImage: widget.user?.profilePhoto,
                    userId: widget.post.userId,
                    title: widget.post.title,
                    date: widget.post.date,
                    searchImage: true,
                    getImage: notifier.getUserPhoto,
                    cornerAction: widget.cornerAction,
                  ),
                  
                  
                  Text(
                    widget.post.content,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: TextColor.gray.textColor
                    ),
                  ),
                  if(widget.post.images.isNotEmpty)
                    ImagesContainer(images: widget.post.images),
                  
                  ReactionsContainer(
                    post: widget.post,
                    onTapReaction: notifier.reactToPost,
                  ),

                  CommentsContainer(
                    source: CommentSource.posts,
                    sourceId: widget.post.id,
                  )
                ],
              );
              }
            ) 
          );
          
  }
}