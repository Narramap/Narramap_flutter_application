
import 'package:narramap/bussiness/data/dto/register_bussiness_dto.dart';
import 'package:narramap/bussiness/domain/model/bussiness.dart';

abstract class IBussinessRepository {

  Future<Bussiness?> register(RegisterBussinessDTO registerDTO);
  Future<Bussiness?> getByUserId(String token);
  Future<List<Bussiness>?> getAll();
  Future<Bussiness?> getById(String bussinessId);
  Future<Bussiness?> updateById(String bussinessId);
  Future<Bussiness?> deleteById(String bussinessId);

  Future<Bussiness?> registerAssistency(String bussinessId);
  
  Future<Bussiness?> rateById(String bussinessId);
  Future<Bussiness?> getRates();
  Future<Bussiness?> getAverageRate();
}