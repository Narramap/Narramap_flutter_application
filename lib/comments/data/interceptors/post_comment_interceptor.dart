import 'package:narramap/comments/data/interceptors/comment_interceptor.dart';

class PostCommentInterceptor {

  final int id;
  final CommentInterceptor comment;
  final String postId;

  PostCommentInterceptor({
    required this.id,
    required this.comment,
    required this.postId
  });

  factory PostCommentInterceptor.fromJson(Map<String, dynamic> json) {
    return PostCommentInterceptor(
      id: json["id"],
      comment: CommentInterceptor.fromJson(json["comment"]),
      postId: json["postId"]
    );
  }

}