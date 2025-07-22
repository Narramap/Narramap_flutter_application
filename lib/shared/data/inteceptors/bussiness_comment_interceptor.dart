
import 'package:narramap/shared/data/inteceptors/comment_interceptor.dart';

class BussinessCommentInterceptor {

  final int id;
  final CommentInterceptor comment;
  final String bussinessId;

  BussinessCommentInterceptor({
    required this.id,
    required this.comment,
    required this.bussinessId
  });

  factory BussinessCommentInterceptor.fromJson(Map<String, dynamic> json) {
    return BussinessCommentInterceptor(
      id: json["id"],
      comment: CommentInterceptor.fromJson(json["comment"]),
      bussinessId: json["bussinessId"]
    );
  }

}