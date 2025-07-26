
class CreateReportDto {

  final String userId;
  final String reason;

  CreateReportDto({
    required this.userId,
    required this.reason
  });

  Map<String, dynamic> toJsonMap() {
    return {
      "userId" : userId,
      "reason" : reason
    };
  }

}