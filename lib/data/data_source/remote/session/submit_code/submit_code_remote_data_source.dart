import '../../../../../api/model/session/submit_code/submit_code_request_model_dto.dart';
import '../../../../../api/model/session/submit_code/submit_code_response_model_dto.dart';

abstract class SubmitCodeRemoteDataSource {
  Future<SubmitCodeResponseModelDto> submitCode({
    required int sessionId,
    required SubmitCodeRequestModelDto dto,
  });
}
