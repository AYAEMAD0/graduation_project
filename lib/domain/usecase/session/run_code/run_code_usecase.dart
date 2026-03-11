import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/domain/entities/session/run_code/run_code_request_entity.dart';

import '../../../entities/session/run_code/run_code_response_entity.dart';
import '../../../repo/session/run_code/run_code_repo.dart';

@injectable
class RunCodeUseCase {
  final RunCodeRepo runCodeRepo;

  RunCodeUseCase(this.runCodeRepo);

  Future<RunCodeResponseEntity> call({
    required int sessionId,
    required RunCodeRequestEntity entity,
  }) {
    return runCodeRepo.runCode(sessionId: sessionId, entity: entity);
  }
}
