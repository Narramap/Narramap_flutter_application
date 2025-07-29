
class KeyDriver {

  final String feature;
  final String impact;
  final String reason;

  KeyDriver({
    required this.feature,
    required this.impact,
    required this.reason
  });

  factory KeyDriver.fromJson(Map<String, dynamic> json) {
    return KeyDriver(
      feature: json["feature"], 
      impact: json["impact"], 
      reason: json["reason"]
    );
  }
}