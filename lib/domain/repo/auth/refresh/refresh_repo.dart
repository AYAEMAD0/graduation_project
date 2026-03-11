import 'package:mock_mate_ai/domain/entities/auth/refresh/refresh_entity.dart';

abstract class RefreshRepo {
  Future<RefreshEntity> refresh(String refreshToken);
}