import '../../../entities/session/answer_mcq/answer_mcq_request_entity.dart';
import '../../../entities/session/answer_mcq/answer_mcq_response_entity.dart';

abstract class AnswerMcqRepo {
  Future<AnswerMcqResponseEntity> answerMcq({
    required int sessionId,
    required AnswerMcqRequestEntity entity,
  });
}
