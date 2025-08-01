import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:narramap/posts/domain/model/post.dart';
import 'package:narramap/map/presentation/screen/widget/report_modal.dart';
import 'package:narramap/shared/presentation/widgets/containers/card_header.dart';
import 'package:narramap/posts/presentation/widgets/post_card.dart';

void showPostModal(
  BuildContext context, 
  Post post,
  Future<void> Function() reportPost,
  String Function(String) onChangeReason,
) {


  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black.withAlpha(126),
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.all(16),
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(color: Colors.transparent),
            ),

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
                    child: PostCard(
                      post: post,
                      cornerAction: CornerAction<void>(
                        icon: Icons.warning, 
                        action: () => showReportModal(
                            context,
                            post.id,
                            onChangeReason,
                            reportPost
                          ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Botón de cerrar (X)
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.8),
                  ),
                  padding: EdgeInsets.all(6),
                  child: Icon(Icons.close, size: 20),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
