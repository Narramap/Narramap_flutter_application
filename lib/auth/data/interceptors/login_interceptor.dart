
class LoginInterceptor{

  final String token;
  final String userId;

  LoginInterceptor({
    required this.token,
    required this.userId
  });

  factory LoginInterceptor.fromJson(Map<String, dynamic> json) {
    return LoginInterceptor(
      token: json["access_token"], 
      userId:json["user"]["id"]
    );
  }
}