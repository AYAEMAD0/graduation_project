import 'package:flutter/foundation.dart';

class ApiEndpoint {
  static String baseUrl = kDebugMode
      ? 'http://mockmate-001-site1.mtempurl.com'
      : '';
  static const String signupApi = '/api/users';
  static const String loginApi = '/api/users/login';
  static const String refreshTokenApi = '/api/users/refresh';
  static const String updateProfileApi = '/api/users/profile';
  static const String getUserByIdApi = '/api/users';
  static const String logoutApi = '/api/users/logout';

  static const String startInterviewSessionApi = '/interview-sessions';
  static const String startAiInterviewApi = '/interview-sessions/ai';
  static const String historyApi = '/users/me/interview-sessions';
  static const String startLiveInterviewApi = '/interview-sessions/live';

  static String getSessionApi(int sessionId) =>
      '/interview-sessions/$sessionId';
  static String answerMcqApi(int sessionId) =>
      '/interview-sessions/$sessionId/answer-mcq';
  static String runCodeApi(int sessionId) =>
      '/interview-sessions/$sessionId/run-code';
  static String submitCodeApi(int sessionId) =>
      '/interview-sessions/$sessionId/submit-code';
  static String submitAnswerApi(int sessionId) =>
      '/interviews/$sessionId/submit';

  static String submitLiveInterviewApi(int id) =>
      '/interview-sessions/$id/live/submit';
}