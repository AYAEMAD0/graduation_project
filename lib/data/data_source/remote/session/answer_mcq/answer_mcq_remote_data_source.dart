import '../../../../../api/model/session/answer_mcq/answer_mcq_request_model_dto.dart';
import '../../../../../api/model/session/answer_mcq/answer_mcq_response_model_dto.dart';

abstract class AnswerMcqRemoteDataSource {
  Future<AnswerMcqResponseModelDto> answerMcq({
    required int sessionId,
    required AnswerMcqRequestModelDto dto,
  });
}
