
import 'package:narramap/bussiness/data/interceptors/bussiness_forecast.dart';
import 'package:narramap/bussiness/data/interceptors/key_driver.dart';

class BussinessPredictionInterceptor {

  final String bussinessId;
  final DateTime predictionDate;
  final BussinessForecast forecast;
  final List<KeyDriver> keyDrivers;

  BussinessPredictionInterceptor({
    required this.bussinessId,
    required this.predictionDate,
    required this.forecast,
    required this.keyDrivers
  });

  factory BussinessPredictionInterceptor.fromJson(Map<String, dynamic> json) {
    return BussinessPredictionInterceptor(
      bussinessId: json["bussiness_id"], 
      predictionDate: json["prediction_date"], 
      forecast: json["forecast"], 
      keyDrivers: (json["key_drivers"] as List<dynamic>).map(
        (keyJson) => KeyDriver.fromJson(keyJson as Map<String, dynamic>)
      ).toList()
    );
  }


}