import 'package:mock_mate_ai/api/model/session/submit_answer/submit_answer_model_dto.dart';

abstract class SubmitAnswerRemoteDataSource {
  Future<SubmitAnswerModelDTO> submitAnswer({required int sessionId});
}
