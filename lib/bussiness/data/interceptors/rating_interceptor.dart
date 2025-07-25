
class RatingInterceptor {

  final int id;
  final int rating;
  final String userId;
  final String bussinessId;

  RatingInterceptor({
    required this.id,
    required this.rating,
    required this.userId,
    required this.bussinessId,
  });

  factory RatingInterceptor.fromJson(Map<String, dynamic> json) {
    return RatingInterceptor(
      id: json["id"],
      rating: json["rating"],
      userId: json["id_user"],
      bussinessId: json["bussinessId"],
    );
  }
}
