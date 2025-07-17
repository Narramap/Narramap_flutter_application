
class LoginInterceptor{

  final String token;
  final String userId;
  final bool bussiness;

  LoginInterceptor({
    required this.token,
    required this.userId,
    required this.bussiness,
  });

  factory LoginInterceptor.fromJson(Map<String, dynamic> json) {
    return LoginInterceptor(
      token: json["access_token"], 
      userId:json["user"]["id"],
      bussiness: json["user"]["bussiness"]
    );
  }
}