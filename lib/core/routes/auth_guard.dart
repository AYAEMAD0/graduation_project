import 'package:mock_mate_ai/domain/repo/auth/token/token_storage.dart';

class AuthGuard {

  static Future<bool> isLoggedIn(
      TokenStorage tokenStorage,
      ) async {

    final token = await tokenStorage.getAccessToken();

    return token != null && token.isNotEmpty;
  }
}