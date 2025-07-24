
import 'package:flutter/material.dart';
import 'package:narramap/shared/data/inteceptors/comment_interceptor.dart';
import 'package:narramap/shared/presentation/notifiers/comment_container_notifier.dart';
import 'package:narramap/shared/presentation/widgets/comment_card.dart';
import 'package:narramap/shared/presentation/widgets/custom_button.dart';
import 'package:narramap/shared/presentation/widgets/custom_switch.dart';
import 'package:narramap/shared/presentation/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

enum CommentSource  {
  posts,
  event,
  bussiness
}

class CommentsContainer extends StatelessWidget {
  
  final CommentSource source;
  final String sourceId;
  final void Function(String) onChangeComment;
  final void Function() saveComment;
  
  const CommentsContainer({
    required this.source,
    required this.sourceId,
    required this.saveComment,
    required this.onChangeComment,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CommentContainerNotifier(),
      child: Consumer<CommentContainerNotifier>(
        builder: (context, notifier, _) => FutureBuilder(
          future: notifier.getAll(source, sourceId), 
          builder: (context, snapshot) => snapshot.connectionState == ConnectionState.waiting ? 
            CircularProgressIndicator()
            :
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                CustomButton(
                  text: notifier.comments.length.toString(),
                  icon: Icons.comment, 
                  onPressed: notifier.toggleShowComments
                ),
                if(notifier.showComments)
                ...[
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
              
                  ...notifier.comments.map(
                    (comment) => CommentCard(
                      comment: comment,
                      currentUserId: notifier.currentUserId,
                      getUserPhoto: notifier.getUserPhoto,
                      deleteComment: notifier.deleteComment,
                    )
                  )
                ],
            
                
              ],
            ),
        ),
      ),
    );
  }
}