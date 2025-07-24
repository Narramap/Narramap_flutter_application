import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:narramap/shared/data/inteceptors/comment_interceptor.dart';
import 'package:narramap/shared/presentation/notifiers/comment_container_notifier.dart';
import 'package:narramap/shared/presentation/widgets/card_header.dart';
import 'package:narramap/shared/presentation/widgets/custom_button.dart';
import 'package:narramap/shared/presentation/widgets/custom_switch.dart';
import 'package:narramap/users/domain/model/user.dart';
import 'package:provider/provider.dart';

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
    this.getUserPhoto
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
          Row(
            children: [
              CardHeader(
                searchImage: true,
                getImage: getUserPhoto,
                title: "" , 
                date: DateTime.fromMillisecondsSinceEpoch(comment.timestamp), 
                userId: comment.userId
              ),
              if(comment.userId == currentUserId)
                IconButton(
                  onPressed: () => deleteComment(comment.id), 
                  icon: Icon(Icons.delete)
                )
            ],
          ),
          
          // Text(
          //   comment.userId,
          //   style: TextStyle(
          //     color: TextColor.gray.textColor
          //   ),
          // ),
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