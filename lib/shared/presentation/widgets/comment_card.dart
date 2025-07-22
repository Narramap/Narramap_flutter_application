
import 'package:flutter/widgets.dart';
import 'package:narramap/shared/data/inteceptors/comment_interceptor.dart';
import 'package:narramap/shared/presentation/widgets/custom_button.dart';
import 'package:narramap/shared/presentation/widgets/custom_switch.dart';

class CommentCard extends StatelessWidget {

  final CommentInterceptor comment;
  const CommentCard({
    super.key,
    required this.comment
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
          Text(
            comment.userId,
            style: TextStyle(
              color: TextColor.gray.textColor
            ),
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