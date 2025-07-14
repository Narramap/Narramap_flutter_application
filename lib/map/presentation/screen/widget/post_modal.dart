
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:narramap/content/domain/model/post.dart';
import 'package:narramap/shared/presentation/widgets/post_card.dart';

void showPostModal(BuildContext context, Post post) {
  showDialog(
    context: context, 
    barrierDismissible: true,
    barrierColor: Colors.black.withAlpha(126),
    builder: (BuildContext context) {
      return Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.transparent), // transparente, solo blur
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F2F2)
                  ),
                  child: PostCard(post: post),
                ),
              ),
            ),
          )
        ],
      );
    }
  );
}