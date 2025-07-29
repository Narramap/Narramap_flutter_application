
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:narramap/posts/domain/model/emotional_post.dart';
import 'package:narramap/posts/domain/model/post.dart';
import 'package:narramap/shared/data/enum/emotion_enum.dart';
import 'package:narramap/map/presentation/screen/widget/post_modal.dart';

List<Marker> getPostsMarkers({
  required BuildContext context,
  required List<EmotionalPost> posts, 
  // required void Function(BuildContext context, Post post, void Function() showReportModal, Future<void> Function() reportPost, String Function(String) onChangeReason,) showModal,
  // required void Function(BuildContext context, String postId, String Function(String) onChangeReason,Future<void> Function() onSaveReport,) showReportModal,
  required Future<void> Function(String, void Function()) reportPost,
  required Future<void> Function(String postId) onTapPostMarker,
  required String Function(String) onChangeReason
}) {
  return posts.map(
    (post) => Marker(
    point: post.location, 
    child: GestureDetector(
      onTap: () {
        showPostModal(
          context, 
          Post(
            id: post.id, 
            userId: post.userId, 
            title: post.title, 
            date: post.date, 
            content: post.content, 
            isPublic: post.isPublic, 
            location: post.location, 
            images: post.images, 
            reactions: post.reactions
          ), 
          () => reportPost(post.id, context.pop), 
          onChangeReason
        );
        // showModal(
        //   context, 
        //   post, 
        //   showReportModal, 
        //   () => reportPost(post.id), 
        //   onChangeReason
        // );
        onTapPostMarker(post.id);
      },
      child: Icon(
          Icons.circle,
          color: post.emotion.color,
          size: 20,
        ),
    )

    )
  ).toList();
}