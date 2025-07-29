
import 'package:narramap/bussiness/data/interceptors/bussiness_benchmark.dart';
import 'package:narramap/bussiness/data/interceptors/confidence_interval.dart';

class BussinessForecast {
  final int predictedVisits;
  final ConfidenceInterval confidenceInterval;
  final BussinessBenchmark benchmark;
  
  BussinessForecast({
    required this.predictedVisits,
    required this.confidenceInterval,
    required this.benchmark
  });
  

  factory BussinessForecast.fromJson(Map<String, dynamic> json) {
    return BussinessForecast(
      predictedVisits: json["predicted_visits"],
      confidenceInterval: ConfidenceInterval.fromJson(json["confidence_interval"]),
      benchmark: BussinessBenchmark.fromJson(json["benchmark"]) 
    );
  }

}