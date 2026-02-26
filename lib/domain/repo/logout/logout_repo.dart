import 'package:mock_mate_ai/domain/entities/logout/logout_entity.dart';

abstract class LogoutRepo {
  Future<LogoutEntity> logout();
}