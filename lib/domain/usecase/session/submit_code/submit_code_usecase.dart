import 'package:injectable/injectable.dart';

import '../../../entities/session/submit_code/submit_code_request_entity.dart';
import '../../../entities/session/submit_code/submit_code_response_entity.dart';
import '../../../repo/session/submit_code/submit_code_repo.dart';

@injectable
class SubmitCodeUseCase {
  final SubmitCodeRepo submitCodeRepo;

  SubmitCodeUseCase(this.submitCodeRepo);

  Future<SubmitCodeResponseEntity> call({
    required int sessionId,
    required SubmitCodeRequestEntity entity,
  }) {
    return submitCodeRepo.submitCode(sessionId: sessionId, entity: entity);
  }
}
