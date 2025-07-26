
class UserReportDto {

  final String reason;
  final String reportedUserId;

  UserReportDto({
    required this.reason,
    required this.reportedUserId
  });

  Map<String, dynamic> toJsonMap() => {
    "reason" : reason,
    "reported_user" : reportedUserId
  };


}