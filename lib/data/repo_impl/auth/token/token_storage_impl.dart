import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../domain/repo/auth/token/token_storage.dart';

@LazySingleton(as: TokenStorage)
class TokenStorageImpl implements TokenStorage {
  final FlutterSecureStorage secureStorage;

  TokenStorageImpl(this.secureStorage);

  static const _accessTokenKey = 'ACCESS_TOKEN';
  static const _refreshTokenKey = 'REFRESH_TOKEN';

  Future<void> _write(String key, String value) async {
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, value);
    } else {
      await secureStorage.write(key: key, value: value);
    }
  }

  Future<String?> _read(String key) async {
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(key);
    } else {
      return await secureStorage.read(key: key);
    }
  }

  Future<void> _delete(String key) async {
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(key);
    } else {
      await secureStorage.delete(key: key);
    }
  }

  @override
  Future<void> saveAccessToken(String token) => _write(_accessTokenKey, token);

  @override
  Future<void> saveRefreshToken(String token) =>
      _write(_refreshTokenKey, token);

  @override
  Future<String?> getAccessToken() => _read(_accessTokenKey);

  @override
  Future<String?> getRefreshToken() => _read(_refreshTokenKey);

  @override
  Future<void> clearTokens() async {
    await _delete(_accessTokenKey);
    await _delete(_refreshTokenKey);
  }
}