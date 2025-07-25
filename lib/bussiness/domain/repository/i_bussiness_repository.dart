
import 'package:narramap/bussiness/data/dto/register_bussiness_dto.dart';
import 'package:narramap/bussiness/data/dto/update_bussiness_dto.dart';
import 'package:narramap/bussiness/data/interceptors/event_assistance_interceptor.dart';
import 'package:narramap/bussiness/data/interceptors/rating_interceptor.dart';
import 'package:narramap/bussiness/domain/model/bussiness.dart';

abstract class IBussinessRepository {

  Future<Bussiness?> register(RegisterBussinessDTO registerDTO);
  Future<Bussiness?> getByUserId();
  Future<List<Bussiness>?> getAll();
  Future<Bussiness?> getById(String bussinessId);
  Future<Bussiness?> updateById(String bussinessId, UpdateBussinessDTO updateDTO);
  Future<Bussiness?> deleteById(String bussinessId);

  Future<EventAssistanceInterceptor?> registerAssistency(String bussinessId);
  
  Future<RatingInterceptor?> rateById(String bussinessId, int rating);
  Future<List<RatingInterceptor>?> getRates(String bussinessId);
  Future<int?> getAverageRate(String bussinessId);
}