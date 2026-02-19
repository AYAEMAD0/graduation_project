import 'package:mock_mate_ai/domain/entities/refresh/refresh_entity.dart';

abstract class RefreshRepo {
  Future<RefreshEntity> refresh(String refreshToken);
}