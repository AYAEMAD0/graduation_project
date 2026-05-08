import 'package:mock_mate_ai/api/model/session/ai_interview/ai_interview_session_model.dart';

abstract class AiInterviewRemoteDataSource {
  Future<AiInterviewSessionModel> startAiInterviewSession({
    required List<int> cvBytes,
    required String cvFileName,
    required String jobDescription,
  });
}