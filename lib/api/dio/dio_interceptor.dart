import 'package:dio/dio.dart';
import '../../core/exception/app_exception.dart';

class DioInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    AppException appException;

    final responseData = err.response?.data;
    String message = "Something went wrong";
    Map<String, dynamic>? validationErrors;

    if (responseData is Map<String, dynamic>) {
      message = responseData['message'] as String? ?? message;
      validationErrors = responseData['validationErrors'] as Map<String, dynamic>?;
    }

    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.connectionError) {
      appException = NetworkException(message: "No Internet Connection");
    } else if (validationErrors != null) {
      final Map<String, List<String>> errors = {};
      validationErrors.forEach((key, value) {
        errors[key] = List<String>.from(value);
      });
      appException = ValidationException(
        message: message,
        errors: errors,
      );
    } else if (err.response?.statusCode != null) {
      appException = ServerException(
        message: message,
        statusCode: err.response?.statusCode,
      );
    } else {
      appException = UnExpectedException(message: message);
    }

    return handler.next(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        type: err.type,
        error: appException,
      ),
    );
  }
}
