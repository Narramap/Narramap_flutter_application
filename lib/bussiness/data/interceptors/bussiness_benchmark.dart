class BussinessBenchmark {

  final String incrementVsLastWeek;
  final String incrementMonthlyAverage;

  BussinessBenchmark({
    required this.incrementMonthlyAverage,
    required this.incrementVsLastWeek
  });

  factory BussinessBenchmark.fromJson(Map<String, dynamic> json) {
    return BussinessBenchmark(
      incrementMonthlyAverage: json["vs_last_week"], 
      incrementVsLastWeek: json["vs_mothly_average"]
    );
  }
}