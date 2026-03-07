import '../../../../../api/model/session/run_code/run_code_ request_model_dto.dart';

abstract class RunCodeRemoteDataSource {
  Future<RunCodeResponseDto> runCode({
    required int sessionId,
    required RunCodeRequestModelDto dto,
  });
}
