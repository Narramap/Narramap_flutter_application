
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:narramap/content/data/dto/reaction_to_post_dto.dart';
import 'package:narramap/content/domain/model/post.dart';
import 'package:narramap/shared/presentation/widgets/post_card.dart';

void showPostModal(BuildContext context, Post post, Future<Post?> Function(ReactionToPostDTO) react) {
  showDialog(
    context: context, 
    barrierDismissible: true,
    barrierColor: Colors.black.withAlpha(126),
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.all(16), // padding general
        child: Stack(
          children: [
            // Fondo difuminado (blur)
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(color: Colors.transparent),
            ),
            // Contenido principal del modal
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.9,
                  maxWidth: MediaQuery.of(context).size.width * 0.95,
                ),
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(200),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: PostCard(post: post, react: react,),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  );
}