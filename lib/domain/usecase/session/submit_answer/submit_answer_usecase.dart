import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/domain/entities/session/submit_answer/submit_answer_entity.dart';
import 'package:mock_mate_ai/domain/repo/session/submit_answer/submit_answer_repo.dart';
@injectable
class SubmitAnswerUsecase {
  final SubmitAnswerRepo submitAnswerRepo;

  SubmitAnswerUsecase(this.submitAnswerRepo);

  Future<SubmitAnswerEntity> call({required int sessionId}) {
    return submitAnswerRepo.submitAnswer(sessionId: sessionId);
  }
}
