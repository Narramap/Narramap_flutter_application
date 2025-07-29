
class ConfidenceInterval {
  final int lowerBound;
  final int upperBound;

  ConfidenceInterval({
    required this.lowerBound,
    required this.upperBound
  });

  factory ConfidenceInterval.fromJson(Map<String, dynamic> json) {
    return ConfidenceInterval(
      lowerBound: json["lower_bound"], 
      upperBound: json["upper_bound"]
    );
  }
}