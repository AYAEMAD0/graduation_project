import 'package:mock_mate_ai/domain/entities/session/submit_answer/submit_answer_entity.dart';

abstract class SubmitAnswerRepo {
  Future<SubmitAnswerEntity> submitAnswer({required int sessionId});
}
