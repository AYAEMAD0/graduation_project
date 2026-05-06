import 'package:mock_mate_ai/data/model/session/ai_interview_session_model.dart';

abstract class AiInterviewRemoteDataSource {
  Future<AiInterviewSessionModel> startAiInterviewSession({
    required List<int> cvBytes,
    required String cvFileName,
    required String jobDescription,
  });
}