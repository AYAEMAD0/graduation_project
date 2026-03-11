import '../../../entities/auth/logout/logout_entity.dart';

abstract class LogoutRepo {
  Future<LogoutEntity> logout();
}