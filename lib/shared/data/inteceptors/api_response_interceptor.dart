
class ApiResponseInterceptor<T> {

  final String message;
  final T data;
  final bool success;

  ApiResponseInterceptor({
    required this.message,
    required this.data,
    required this.success
  });

  factory ApiResponseInterceptor.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJson) {

    return ApiResponseInterceptor(
      message: json["message"], 
      data: fromJson(json["data"]), 
      success: json["success"]
    );
  }
}