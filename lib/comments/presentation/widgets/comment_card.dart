import 'package:flutter/material.dart';
import 'package:narramap/comments/data/interceptors/comment_interceptor.dart';
import 'package:narramap/shared/presentation/widgets/containers/card_header.dart';
import 'package:narramap/shared/presentation/widgets/buttons/custom_button.dart';
import 'package:narramap/shared/presentation/widgets/inputs/custom_switch.dart';

class CommentCard extends StatelessWidget {

  final CommentInterceptor comment;
  final String currentUserId;
  final Future<String?> Function(String)? getUserPhoto;
  final Future<void> Function(String) deleteComment;

  const CommentCard({
    super.key,
    required this.comment,
    required this.currentUserId,
    required this.deleteComment,
    this.getUserPhoto,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ButtonColors.gray.backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          CardHeader(
            searchImage: true,
            getImage: getUserPhoto,
            title: "comentario" , 
            date: DateTime.fromMillisecondsSinceEpoch(comment.timestamp), 
            userId: comment.userId,
            cornerAction: comment.userId == currentUserId ? CornerAction(
              icon: Icons.delete, 
              action: () => deleteComment(comment.id)
            ) 
            : null ,
          ),
          
          Text(
            comment.content,
            style: TextStyle(
              color: TextColor.gray.textColor
            ),
          )
        ],
      ),
    );
  }
}