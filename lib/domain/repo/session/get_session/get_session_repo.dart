import 'package:mock_mate_ai/domain/entities/session/get_session/get_session_entity.dart';

abstract class GetSessionRepo {
  Future<GetSessionEntity> getSession({required int sessionId});
}
