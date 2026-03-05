import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/domain/entities/session/get_session/get_session_entity.dart';

import '../../../repo/session/get_session/get_session_repo.dart';

@injectable
class GetSessionUseCase {
  final GetSessionRepo getSessionRepo;

  GetSessionUseCase(this.getSessionRepo);

  Future<GetSessionEntity> call({required int sessionId}) {
    return getSessionRepo.getSession(sessionId: sessionId);
  }
}
