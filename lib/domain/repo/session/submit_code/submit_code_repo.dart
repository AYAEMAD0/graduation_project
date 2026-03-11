import '../../../entities/session/submit_code/submit_code_request_entity.dart';
import '../../../entities/session/submit_code/submit_code_response_entity.dart';

abstract class SubmitCodeRepo {
  Future<SubmitCodeResponseEntity> submitCode({
    required int sessionId,
    required SubmitCodeRequestEntity entity,
  });
}
