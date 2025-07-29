import 'package:flutter/material.dart';
import 'package:narramap/posts/data/dto/reaction_to_post_dto.dart';
import 'package:narramap/posts/data/interceptors/reaction_interceptor.dart';
import 'package:narramap/posts/domain/model/post.dart';
import 'package:narramap/core/storage/secure_storage.dart';
import 'package:narramap/shared/data/enum/reactions_enum.dart';
import 'package:narramap/shared/presentation/widgets/buttons/custom_button.dart';
import 'package:narramap/shared/presentation/widgets/inputs/custom_switch.dart';

class ReactionsContainer extends StatefulWidget {


  final Post post;
  final Future<Post?> Function(ReactionToPostDTO) onTapReaction;

  const ReactionsContainer({
    super.key,
    required this.post,
    required this.onTapReaction
  });

  @override
  State<ReactionsContainer> createState() => _ReactionsContainerState();
}

class _ReactionsContainerState extends State<ReactionsContainer> {

  late List<ReactionInterceptor> _reactions;

  @override
  void initState() {
    super.initState();
    _reactions = widget.post.reactions;
  }

  @override
  Widget build(BuildContext context) {

  
    return Wrap( // Wrap en lugar de Row si puede haber muchas reacciones
      alignment: WrapAlignment.start,
      runSpacing: 5,
      spacing: 5,
      children: [
        
        ..._reactions.map((reaction) {
          return GestureDetector(
            onTap: () async {
              
              final userId = await SecureStorage.getUserId();
              final post = await widget.onTapReaction(
                ReactionToPostDTO(
                postId: widget.post.id, 
                userId: userId!, 
                reactionId: reaction.id
                )
              );

              if(post != null) {
                setState(() {
                  _reactions = post.reactions;
                });
              }
            },

            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: ButtonColors.gray.backgroundColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    reaction.quantity.toString(),
                    style: TextStyle(
                      color: TextColor.gray.textColor,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Image.asset(
                    "assets/icons/${ReactionsEnum.getReactionImage(reaction.id)}",
                    width: 16,
                    height: 16,
                  ),
                ],
              ),
            ),
          );
        }),
      ]
    );
  }
}
