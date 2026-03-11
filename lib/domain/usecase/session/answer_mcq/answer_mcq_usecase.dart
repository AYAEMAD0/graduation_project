import 'package:injectable/injectable.dart';

import '../../../entities/session/answer_mcq/answer_mcq_request_entity.dart';
import '../../../entities/session/answer_mcq/answer_mcq_response_entity.dart';
import '../../../repo/session/answer_mcq/answer_mcq_repo.dart';

@injectable
class AnswerMcqUseCase {
  final AnswerMcqRepo answerMcqRepo;

  AnswerMcqUseCase(this.answerMcqRepo);

  Future<AnswerMcqResponseEntity> call({
    required int sessionId,
    required AnswerMcqRequestEntity entity,
  }) {
    return answerMcqRepo.answerMcq(sessionId: sessionId, entity: entity);
  }
}
