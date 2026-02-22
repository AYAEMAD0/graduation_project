import 'package:mock_mate_ai/api/model/refresh/refresh_model_dto.dart';

abstract class RefreshRemoteDataSource {
  Future<RefreshModelDto> refresh(String refreshToken);
}
