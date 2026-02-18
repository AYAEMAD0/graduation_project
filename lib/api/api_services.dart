import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio;

  ApiServices(this.dio);

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    return await dio.get(
      path,
      queryParameters: queryParameters,
    );
  }

  Future<Response> post(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    return await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
    );
  }

  Future<Response> put(String path, {dynamic data}) async {
    return await dio.put(
      path,
      data: data,
    );
  }

  Future<Response> delete(String path) async {
    return await dio.delete(path);
  }
}
