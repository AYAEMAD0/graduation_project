import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/api/api_endpoint.dart';
import 'package:mock_mate_ai/core/helper/jwt_helper.dart';
import 'package:mock_mate_ai/domain/repo/auth/token/token_storage.dart';

import '../../core/exception/app_exception.dart';

@LazySingleton()
class DioInterceptor extends Interceptor {
  final TokenStorage tokenStorage;

  late Dio _dio;

  DioInterceptor(this.tokenStorage);

  bool _isRefreshing = false;
  Future<String?>? _refreshFuture;

  void setDio(Dio dio) {
    _dio = dio;
  }

  Future<String?> _refreshToken() async {
    if (_isRefreshing) {
      return _refreshFuture;
    }

    _isRefreshing = true;
    _refreshFuture = Future<String?>(() async {
      try {
        final refreshToken = await tokenStorage.getRefreshToken();

        if (refreshToken == null || refreshToken.isEmpty) {
          return null;
        }

        final response = await _dio.post(
          ApiEndpoint.refreshTokenApi,
          data: {"token": refreshToken},
        );

        final accessToken = response.data['accessToken'];

        final newRefreshToken = response.data['refreshToken'];

        await tokenStorage.saveAccessToken(accessToken);

        await tokenStorage.saveRefreshToken(newRefreshToken);

        return accessToken;
      } catch (_) {
        await tokenStorage.clearTokens();

        return null;
      } finally {
        _isRefreshing = false;
      }
    });
    return _refreshFuture;
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Prevent refresh recursion
    if (options.path.contains('/refresh')) {
      return handler.next(options);
    }

    String? accessToken = await tokenStorage.getAccessToken();

    if (accessToken != null && accessToken.isNotEmpty) {
      final isExpired = JwtHelper.isTokenExpired(accessToken);

      if (isExpired) {
        accessToken = await _refreshToken();
      }

      if (accessToken != null) {
        options.headers['Authorization'] = 'Bearer $accessToken';
      }
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Prevent refresh recursion
    if (err.requestOptions.path.contains('/refresh')) {
      return handler.next(err);
    }

    if (err.response?.statusCode == 401) {
      final newAccessToken = await _refreshToken();

      if (newAccessToken == null) {
        return handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            response: err.response,
            type: DioExceptionType.badResponse,
            error: "Session expired",
          ),
        );
      }

      final requestOptions = err.requestOptions.copyWith(
        headers: {
          ...err.requestOptions.headers,
          'Authorization': 'Bearer $newAccessToken',
        },
      );

      try {
        final retryResponse = await _dio.fetch(requestOptions);

        return handler.resolve(retryResponse);
      } catch (_) {
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
          responseData['message'] as String? ?? "Unexpected error occurred";

      return handler.next(
        DioException(
          requestOptions: err.requestOptions,
          response: err.response,
          type: err.type,
          error: ServerException(message: message),
        ),
      );
    }

    return handler.next(err);
  }
}
