
class CommentInterceptor {

  final String userId;
  final String content;
  final int timestamp;

  CommentInterceptor({
    required this.userId,
    required this.content,
    required this.timestamp
  });

  factory CommentInterceptor.fromJson(Map<String, dynamic> json) {
    return CommentInterceptor(
      userId: json["userId"], 
      content: json["content"], 
      timestamp: json["timestamp"]
    );
  }
}