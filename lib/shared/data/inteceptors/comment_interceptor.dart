
class CommentInterceptor {

  final String id;
  final String userId;
  final String content;
  final int timestamp;

  CommentInterceptor({
    required this.id,
    required this.userId,
    required this.content,
    required this.timestamp
  });

  factory CommentInterceptor.fromJson(Map<String, dynamic> json) {
    return CommentInterceptor(
      id: json["id"],
      userId: json["userId"], 
      content: json["content"], 
      timestamp: json["timestamp"]
    );
  }
}