
import 'package:injectable/injectable.dart';
import 'package:narramap/bussiness/data/dto/register_bussiness_dto.dart';
import 'package:narramap/bussiness/domain/model/bussiness.dart';
import 'package:narramap/bussiness/domain/repository/i_bussiness_repository.dart';

@Injectable()
class BussinessRepository implements IBussinessRepository {

  @override
  Future<Bussiness?> register(RegisterBussinessDTO registerDTO) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<List<Bussiness>?> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<Bussiness?> getById(String bussinessId) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<Bussiness?> getByUserId(String token) {
    // TODO: implement getByUserId
    throw UnimplementedError();
  }

  @override
  Future<Bussiness?> updateById(String bussinessId) {
    // TODO: implement updateById
    throw UnimplementedError();
  }

  @override
  Future<Bussiness?> deleteById(String bussinessId) {
    // TODO: implement deleteById
    throw UnimplementedError();
  }

  @override
  Future<Bussiness?> registerAssistency(String bussinessId) {
    // TODO: implement registerAssistency
    throw UnimplementedError();
  }

  @override
  Future<Bussiness?> getRates() {
    // TODO: implement getRates
    throw UnimplementedError();
  }

  @override
  Future<Bussiness?> getAverageRate() {
    // TODO: implement getAverageRate
    throw UnimplementedError();
  }

  @override
  Future<Bussiness?> rateById(String bussinessId) {
    // TODO: implement rateById
    throw UnimplementedError();
  }
}