import 'package:mock_mate_ai/api/model/logout/logout_model_dto.dart';

abstract class LogoutRemoteDataSource {
  Future<LogoutModelDto> logout(String refreshToken);
}