import 'package:narramap/shared/data/inteceptors/comment_interceptor.dart';

class EventCommentInterceptor {

  final int id;
  final CommentInterceptor comment;
  final String eventId;

  EventCommentInterceptor({
    required this.id,
    required this.comment,
    required this.eventId
  });

  factory EventCommentInterceptor.fromJson(Map<String, dynamic> json) {
    return EventCommentInterceptor(
      id: json["id"],
      comment: CommentInterceptor.fromJson(json["comment"]),
      eventId: json["eventId"]
    );
  }

}