import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();

  static String? authToken;

  late final Dio dio;

  DioClient._internal() {

    dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      headers: {
        "Content-Type": "application/json"
      })
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (authToken != null) {
            options.headers["Authorization"] = "Bearer $authToken";
          }
          return handler.next(options);
        }
      )
    );

    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true
    ));
  }

  static Future<T?> get<T>({
    required String path,
    required T Function(dynamic json) fromJsonT,
  }) async {
    try {
      
      final res = await _instance.dio.get(path);

      final json = jsonDecode(jsonEncode(res.data));
      final apiRes = fromJsonT(json);

      return apiRes;
    } catch (e) {
      print("error en el get de dio: $e");
      return null;
    }
  }

  static Future<T?> post<T>({
    required String path,
    required Map<String, dynamic> body,
    required T Function(dynamic json) fromJsonT,
  }) async {
    try {
      final res = await _instance.dio.post(path, data: body);

      final json = jsonDecode(jsonEncode(res.data));
      final apiRes = fromJsonT(json);

      return apiRes;
    } catch (e) {
      print("error en el post de dio: $e");
      return null;
    }
  }

  static Future<T?> patch<T>({
    required String path,
    required Map<String, dynamic> body,
    required T Function(dynamic json) fromJsonT
  }) async {
    try {
      final res = await _instance.dio.patch(
        path,
        data: body
      );

      final json = jsonDecode(jsonEncode(res.data));
      final apiRes = fromJsonT(json);

      return apiRes;
    } catch(e) {
      print("error en el patch de dio: $e");
      return null;
    }
  }

  static Future<T?> put<T>({
    required String path,
    required Map<String, dynamic> body,
    required T Function(dynamic json) fromJsonT
  }) async {
    try {
      final res = await _instance.dio.put(
        path,
        data: body
      );

      final json = jsonDecode(jsonEncode(res.data));
      final apiRes = fromJsonT(json);

      return apiRes;
    } catch(e) {
      print("error en el post de dio: $e");
      return null;
    }
  }

  

  static Future<T?> delete<T>({
    required String path,
    required T Function(dynamic json) fromJsonT,
  }) async {
    try {
      final res = await _instance.dio.delete(
        path,
      );

      final json = jsonDecode(jsonEncode(res.data));
      final apiRes = fromJsonT(json);
      return apiRes;
    } catch (e) {
      print("error en el delete de dio: $e");
      return null;
    }
  }

  static Future<T?> postMultipart<T>({
    required String path,
    required FormData formData,
    required String token,
    required T Function(dynamic json) fromJsonT,
  }) async {
    try {
      final res = await _instance.dio.post(
        path,
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      final json = jsonDecode(jsonEncode(res.data));
      final apiRes = fromJsonT(json);
      return apiRes;
    } catch (e) {
      print("error en postMultipart de dio: $e");
      return null;
    }
  }

  static Future<T?> patchMultipart<T>({
    required String path,
    required FormData body,
    required String token,
    required T Function(dynamic json) fromJsonT
  }) async {
    try {
      final res = await _instance.dio.patch(
        path,
        data: body,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      final json = jsonDecode(jsonEncode(res.data));
      final apiRes = fromJsonT(json);
      return apiRes;
    } catch (e) {
      print("error en postMultipart de dio: $e");
      return null;
    }
  }



}
