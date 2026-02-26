import 'package:dio/dio.dart';
import '../exception/app_exception.dart';

class ExceptionHandler {
  static String getMessage(Object e) {
    if (e is DioException) {
      final error = e.error;

      if (error is ValidationException) {
        return error.errors.values
            .expand((list) => list)
            .join('\n');
      }

      if (error is String) return error;
      return e.message ?? "Unexpected error";
    }
    return e.toString();
  }
}