
class ReactionToPostDTO {

  final String postId;
  final String userId;
  final int reactionId;

  ReactionToPostDTO({
    required this.postId, 
    required this.userId,
    required this.reactionId
  });

  Map<String, dynamic> toJsonMap() => {
    "postId" : postId,
    "userId": userId,
    "reactionId": reactionId
  };
}