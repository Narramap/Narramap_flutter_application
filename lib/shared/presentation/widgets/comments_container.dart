
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:narramap/shared/data/inteceptors/comment_interceptor.dart';
import 'package:narramap/shared/presentation/widgets/comment_card.dart';
import 'package:narramap/shared/presentation/widgets/custom_button.dart';
import 'package:narramap/shared/presentation/widgets/custom_switch.dart';
import 'package:narramap/shared/presentation/widgets/custom_text_field.dart';

class CommentsContainer extends StatelessWidget {

  final List<CommentInterceptor> comments;
  final void Function(String) onChangeComment;
  final void Function() saveComment;
  const CommentsContainer({
    required this.saveComment,
    required this.onChangeComment,
    required this.comments,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        Text(
          "Comentarios",
          style: TextStyle(
            fontSize: 15,
            color: TextColor.gray.textColor
          ),
        ),

        CustomTextField(
          onChanged: onChangeComment, 
          label: "Nuevo comentario",
          textFieldColor: TextFieldColors.gray,
        ),

        CustomButton(
          text: "Comentar", 
          onPressed: saveComment
        ),

        ...comments.map(
          (comment) => CommentCard(comment: comment)
        )

        
      ],
    );
  }
}