
import 'package:flutter/material.dart';
import 'package:narramap/content/data/dto/reaction_to_post_dto.dart';
import 'package:narramap/content/domain/model/post.dart';
import 'package:narramap/map/presentation/notifiers/map_notifier.dart';
import 'package:narramap/shared/presentation/notifiers/post_card_notifier.dart';
import 'package:narramap/shared/presentation/widgets/card_header.dart';
import 'package:narramap/shared/presentation/widgets/comments_container.dart';
import 'package:narramap/shared/presentation/widgets/custom_switch.dart';
import 'package:narramap/shared/presentation/widgets/images_container.dart';
import 'package:narramap/shared/presentation/widgets/reactions_container.dart';
import 'package:narramap/users/domain/model/user_profile.dart';
import 'package:provider/provider.dart';

class PostCard extends StatefulWidget {

  final Post post;
  final UserProfile? user;
  final Future<void> Function()? deletePost;
  
  const PostCard({
    super.key,
    required this.post,
    this.user,
    this.deletePost,
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
                  Row(
                    children: [
                      CardHeader(
                        userImage: widget.user?.profilePhoto,
                        userId: widget.post.userId,
                        title: widget.post.title,
                        date: widget.post.date,
                        searchImage: true,
                        getImage: notifier.getUserPhoto,
                      ),
                      if(widget.deletePost != null)
                        IconButton(
                          onPressed: widget.deletePost, 
                          icon: Icon(Icons.delete)
                        )
                    ],
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
                    nComments: notifier.nComments,
                    onTapComments: notifier.toggleShowComments,
                    post: widget.post,
                    onTapReaction: notifier.reactToPost,
                  ),

                  if(notifier.showComments)
                    CommentsContainer(
                      saveComment: () => notifier.saveComment(widget.post.id),
                      comments: notifier.comments,
                      onChangeComment: notifier.onChangeCommentContent,
                    )
                ],
              );
              }
            ) 
          );
          // child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   spacing: 10,
          //   children: [
          //     CardHeader(
          //       userImage: user?.profilePhoto,
          //       userId: post.userId,
          //       title: post.title,
          //       date: post.date,
          //       searchImage: true,
          //       getImage: notifier.getUserPhoto,
          //     ),
          //     Text(
          //       post.content,
          //       textAlign: TextAlign.justify,
          //       style: TextStyle(
          //         color: TextColor.gray.textColor
          //       ),
          //     ),
          //     if(post.images.isNotEmpty)
          //       ImagesContainer(images: post.images),
          //       // ClipRRect(
          //       //   borderRadius: BorderRadius.circular(10),
          //       //   child: Container(
          //       //     width: double.infinity,
          //       //     height: 300,
          //       //     decoration: BoxDecoration(
          //       //       borderRadius: BorderRadius.circular(20)
          //       //     ),          
          //       //     child: Image.network(
          //       //       post.images[0],
          //       //       fit: BoxFit.fill,
          //       //     ),
          //       //   ),
          //       // ),
              
          //     ReactionsContainer(
          //       nComments: notifier.nComments,
          //       onTapComments: notifier.toggleShowComments,
          //       post: post,
          //       onTapReaction: notifier.reactToPost,
          //     )
          //   ],
          // ),

  }
}