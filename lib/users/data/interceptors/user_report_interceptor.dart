
class UserReportInterceptor {

  final int id;
  final String reason;
  final String reportedUserId;
  final String userId;

  UserReportInterceptor({
    required this.id,
    required this.reason,
    required this.reportedUserId,
    required this.userId
  });

  factory UserReportInterceptor.fromJson(Map<String, dynamic> json) {
    return UserReportInterceptor(
      id: json["id"], 
      reason: json["reason"], 
      reportedUserId: json["reported_user"], 
      userId: json["id_user"]
    );
  }

}