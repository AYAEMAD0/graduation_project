import 'package:mock_mate_ai/domain/entities/session/run_code/run_code_request_entity.dart';

import '../../../entities/session/run_code/run_code_response_entity.dart';

abstract class RunCodeRepo {
  Future<RunCodeResponseEntity> runCode({
    required int sessionId,
    required RunCodeRequestEntity entity,
  });
}
