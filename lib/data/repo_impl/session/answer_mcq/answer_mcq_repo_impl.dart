import 'package:injectable/injectable.dart';

import '../../../../api/model/session/answer_mcq/answer_mcq_request_model_dto.dart';
import '../../../../domain/entities/session/answer_mcq/answer_mcq_request_entity.dart';
import '../../../../domain/entities/session/answer_mcq/answer_mcq_response_entity.dart';
import '../../../../domain/repo/session/answer_mcq/answer_mcq_repo.dart';
import '../../../data_source/remote/session/answer_mcq/answer_mcq_remote_data_source.dart';

@Injectable(as: AnswerMcqRepo)
class AnswerMcqRepoImpl implements AnswerMcqRepo {
  final AnswerMcqRemoteDataSource answerMcqRemoteDataSource;

  AnswerMcqRepoImpl(this.answerMcqRemoteDataSource);

  @override
  Future<AnswerMcqResponseEntity> answerMcq({
    required int sessionId,
    required AnswerMcqRequestEntity entity,
  }) async {
    final dto = AnswerMcqRequestModelDto(
      questionId: entity.questionId,
      selectedOptionId: entity.selectedOptionId,
    );

    final result = await answerMcqRemoteDataSource.answerMcq(
      sessionId: sessionId,
      dto: dto,
    );

    return result.toEntity();
  }
}
