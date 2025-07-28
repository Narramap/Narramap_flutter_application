
class EventAssistanceInterceptor {

  final int id;
  final String userId;
  final String bussinessId;

  EventAssistanceInterceptor({
    required this.id,
    required this.userId,
    required this.bussinessId
  });

  factory EventAssistanceInterceptor.fromJson(Map<String, dynamic> json) {
    return EventAssistanceInterceptor(
      id: json["id"], 
      userId: json["id_user"], 
      bussinessId: json["eventId"]
    );
  }
}