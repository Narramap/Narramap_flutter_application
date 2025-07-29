
class CommentDto {

  final String userId;
  final String content;

  CommentDto({
    required this.userId,
    required this.content
  });

  Map<String, dynamic> toJsonMap() {
    return {
      "userId" : userId,
      "content" : content
    };
  }
}