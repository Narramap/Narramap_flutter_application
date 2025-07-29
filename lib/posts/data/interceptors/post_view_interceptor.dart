
class PostViewInterceptor {

  final int id;
  final String postId;
  final String userId;

  PostViewInterceptor({
    required this.id,
    required this.postId,
    required this.userId
  });

  factory PostViewInterceptor.fromJson(Map<String, dynamic> json) {
    return PostViewInterceptor(
      id: json["id"], 
      postId: json["postId"], 
      userId: json["userId"]
    );
  }
}