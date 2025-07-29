
import 'package:flutter/material.dart';
import 'package:narramap/comments/data/interceptors/comment_interceptor.dart';
import 'package:narramap/comments/presentation/notifier/comment_container_notifier.dart';
import 'package:narramap/comments/presentation/widgets/comment_card.dart';
import 'package:narramap/shared/presentation/widgets/buttons/custom_button.dart';
import 'package:narramap/shared/presentation/widgets/inputs/custom_switch.dart';
import 'package:narramap/shared/presentation/widgets/inputs/custom_text_field.dart';
import 'package:provider/provider.dart';

enum CommentSource  {
  posts,
  event,
  bussiness
}

class CommentsContainer extends StatefulWidget {

  final CommentSource source;
  final String sourceId;
  
  const CommentsContainer({
    required this.source,
    required this.sourceId,
    super.key
  });

  @override
  State<CommentsContainer> createState() => _CommentsContainerState();
}

class _CommentsContainerState extends State<CommentsContainer> {

  bool showComments = false;
  late Future<void> _future;
  late CommentContainerNotifier notifier;

  @override
  void initState() {
    super.initState();

    notifier = CommentContainerNotifier();
    _future = notifier.getAll(widget.source, widget.sourceId);
  }

  @override
  Widget build(BuildContext context) {
    return 
    ChangeNotifierProvider.value(
      value: notifier,
      child: Consumer<CommentContainerNotifier>(
        builder: (context, notifier, _) => FutureBuilder(
          future: _future, 
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Comentarios",
                          style: TextStyle(
                            fontSize: 15,
                            color: TextColor.gray.textColor
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            notifier.showAddComment ? Icons.cancel : Icons.add_circle_outline,
                            size: 16,
                            color: TextColor.gray.textColor,
                          ),
                          onPressed: notifier.toggleShowAddComment,
                        )
                      ],
                    ),

                    if(notifier.showAddComment) 
                      ...[
                        CustomTextField(
                          onChanged: notifier.onChangeCommentContent,
                          label: "Nuevo comentario",
                          textFieldColor: TextFieldColors.gray,
                        ),
                        CustomButton(
                          text: "Comentar",
                          onPressed: () => notifier.saveComment(widget.sourceId)
                        ),
                      ],

                    if(notifier.comments.isNotEmpty)
                      ...notifier.comments.map(
                        (comment) => CommentCard(
                          comment: comment,
                          currentUserId: notifier.currentUserId,
                          getUserPhoto: notifier.getUserPhoto,
                          deleteComment: notifier.deleteComment,
                        )
                      )
                    else 
                      Text(
                        "Aun no hay ningun comentario",
                        style: TextStyle(
                          color: TextColor.gray.textColor
                        ),
                      )
                  ]
                  
                ],
            ),
        ),
      ),
    );
  }
}