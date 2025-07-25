
import 'package:injectable/injectable.dart';
import 'package:narramap/bussiness/data/dto/register_bussiness_dto.dart';
import 'package:narramap/bussiness/data/dto/update_bussiness_dto.dart';
import 'package:narramap/bussiness/data/interceptors/event_assistance_interceptor.dart';
import 'package:narramap/bussiness/data/interceptors/rating_interceptor.dart';
import 'package:narramap/bussiness/domain/model/bussiness.dart';
import 'package:narramap/bussiness/domain/repository/i_bussiness_repository.dart';
import 'package:narramap/core/network/dio_client.dart';

@Injectable()
class BussinessRepository implements IBussinessRepository {

  final url = "https://narramapbussinessapi-production.up.railway.app/bussiness";

  @override
  Future<Bussiness?> register(RegisterBussinessDTO registerDTO) async {

    final res = await DioClient.post(
      path: url,
      body: registerDTO.toJsonMap(),
      fromJsonT: (json) => (json as List<dynamic>).map(
        (bussinessJson) => Bussiness.fromJson(bussinessJson as Map<String, dynamic>)
      ).toList()
    );

    return res?[0];
  }

  @override
  Future<List<Bussiness>?> getAll() async {
    final res = await DioClient.get(
      path: "$url/all",
      fromJsonT: (json) => (json as List<dynamic>).map(
        (bussJson) => Bussiness.fromJson(json as Map<String, dynamic>)
      ).toList()
    );

    return res;
  }

  @override
  Future<Bussiness?> getById(String bussinessId) async {
    final res = await DioClient.get(
      path: "$url/details/$bussinessId",
      fromJsonT: (json) => Bussiness.fromJson(json as Map<String, dynamic>)
    );

    return res;
  }

  @override
  Future<Bussiness?> getByUserId() async {
    
    final res = await DioClient.get(
      path: url,
      fromJsonT: (json) => (json as List<dynamic>).map(
        (bussJson) => Bussiness.fromJson(json as Map<String, dynamic>)
      ).toList()
    );

    return res?[0];

  }

  @override
  Future<Bussiness?> updateById(String bussinessId, UpdateBussinessDTO updateDTO) async {

    final res = await DioClient.put(
      path: "$url/$bussinessId",
      body: updateDTO.toJsonMap(),
      fromJsonT: (json) => Bussiness.fromJson(json as Map<String, dynamic>)
    );

    return res;
  }

  @override
  Future<Bussiness?> deleteById(String bussinessId) async {

    final res = await DioClient.get(
      path: "$url/$bussinessId",
      fromJsonT: (json) => Bussiness.fromJson(json as Map<String, dynamic>)
    );

    return res;
  }

  @override
  Future<EventAssistanceInterceptor?> registerAssistency(String bussinessId) async {
    final res = await DioClient.post(
      path: "$url/assistances/$bussinessId",
      body: {},
      fromJsonT: (json) => EventAssistanceInterceptor.fromJson(json as Map<String, dynamic>)
    );

    return res;
  }

  @override
  Future<List<RatingInterceptor>?> getRates(String bussinessId) async {

    final res = await DioClient.get(
      path: url,
      fromJsonT: (json) => (json as List<dynamic>).map(
        (bussJson) => RatingInterceptor.fromJson(json as Map<String, dynamic>)
      ).toList()
    );

    return res;
  }

  @override
  Future<int?> getAverageRate(String bussinessId) async {
    final res = await DioClient.get(
      path: "$url/rating/avg/$bussinessId",
      fromJsonT: (json) => json as int
    );

    return res;
  }

  @override
  Future<RatingInterceptor?> rateById(String bussinessId, int rating) async {
    final res = await DioClient.post(
      path: "$url/rating/$bussinessId?rating=$rating",
      body: {},
      fromJsonT: (json) => RatingInterceptor.fromJson(json as Map<String, dynamic>)
    );

    return res;
  }
}