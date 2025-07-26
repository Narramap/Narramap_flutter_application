
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:narramap/content/domain/model/post.dart';
import 'package:narramap/map/domain/model/emotion_enum.dart';
import 'package:narramap/map/presentation/screen/widget/post_modal.dart';

List<Marker> getPostsMarkers({
  required BuildContext context,
  required List<Post> posts, 
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
          post, 
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
          color: Emotions.happiness.color,
          size: 20,
        ),
    )

    )
  ).toList();
}