
class ReportEntity {

  final int id;
  final String userId;
  final String reason;
  final String reportedPostId;

  ReportEntity({
    required this.id,
    required this.userId,
    required this.reason,
    required this.reportedPostId
  });

  factory ReportEntity.fromJson(Map<String, dynamic> json) {
    return ReportEntity(
      id: json["id"], 
      userId: json["userId"], 
      reason: json["reason"], 
      reportedPostId: json["reportedPostId"]
    );
  }
}