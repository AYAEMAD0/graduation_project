import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/api/api_endpoint.dart';
import 'package:mock_mate_ai/domain/repo/auth/token_storage.dart';

import '../../core/exception/app_exception.dart';

@LazySingleton()
class DioInterceptor extends Interceptor {
  final TokenStorage tokenStorage;

  late Dio _dio;

  DioInterceptor(this.tokenStorage);

  void setDio(Dio dio) {
    _dio = dio;
  }

  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    final accessToken = await tokenStorage.getAccessToken();

    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {

    if (err.requestOptions.path.contains('/refresh')) {
      return handler.next(err);
    }

    if (err.response?.statusCode == 401) {
      try {
        final refreshToken = await tokenStorage.getRefreshToken();

        if (refreshToken == null) {
          return handler.next(err);
        }

        final refreshResponse = await _dio.post(
          ApiEndpoint.refreshTokenApi,
          data: {"token": refreshToken},
        );

        final newAccessToken = refreshResponse.data['accessToken'];
        final newRefreshToken = refreshResponse.data['refreshToken'];

        await tokenStorage.saveAccessToken(newAccessToken);
        await tokenStorage.saveRefreshToken(newRefreshToken);

        final requestOptions = err.requestOptions.copyWith(
          headers: {
            ...err.requestOptions.headers,
            'Authorization': 'Bearer $newAccessToken',
          },
        );

        final retryResponse = await _dio.fetch(requestOptions);

        return handler.resolve(retryResponse);

      } catch (_) {
        await tokenStorage.clearTokens();
        return handler.next(err);
      }
    }

    final responseData = err.response?.data;
    if (responseData is Map<String, dynamic>) {
      if (responseData['validationErrors'] != null) {
        final validationErrors =
        responseData['validationErrors'] as Map<String, dynamic>;

        final Map<String, List<String>> errors = {};
        validationErrors.forEach((key, value) {
          errors[key] = List<String>.from(value);
        });

        return handler.next(
          DioException(
            requestOptions: err.requestOptions,
            response: err.response,
            type: err.type,
            error: ValidationException(
              message: "Validation Error",
              errors: errors,
            ),
          ),
        );
      }

      final message =
          responseData['message'] ?? "Unexpected error occurred";

      return handler.next(
        DioException(
          requestOptions: err.requestOptions,
          response: err.response,
          type: err.type,
          error: message,
        ),
      );
    }

    return handler.next(err);
  }
}
