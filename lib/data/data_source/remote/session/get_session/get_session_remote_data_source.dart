import 'package:mock_mate_ai/api/model/session/get_session/get_session_model_dto.dart';

abstract class GetSessionRemoteDataSource {
  Future<GetSessionModelDto> getSession({required int sessionId});
}
