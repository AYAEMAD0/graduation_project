import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../api_endpoint.dart';
import '../api_services.dart';
import 'dio_interceptor.dart';

@module
abstract class DioModule {

  @singleton
  BaseOptions provideBaseOption() {
    return BaseOptions(
      baseUrl: ApiEndpoint.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
  }

  @singleton
  PrettyDioLogger providePrettyLogger() {
    return PrettyDioLogger(
      request: true,
      responseBody: true,
    );
  }

  @singleton
  Dio provideDio(
    BaseOptions baseOptions,
    DioInterceptor dioInterceptor,
    PrettyDioLogger logger,
  ) {
    final dio = Dio(baseOptions);

    dioInterceptor.setDio(dio);

    dio.interceptors.add(dioInterceptor);
    dio.interceptors.add(logger);

    return dio;
  }


  @singleton
  ApiServices provideApiServices(Dio dio) {
    return ApiServices(dio);
  }
}
