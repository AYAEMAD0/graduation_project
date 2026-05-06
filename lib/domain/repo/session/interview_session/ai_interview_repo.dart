import 'package:mock_mate_ai/domain/entities/session/interview_session/interview_session_entity.dart';

abstract class AiInterviewRepo {
  Future<InterviewSessionEntity> startAiInterview({
    required List<int> cvBytes,
    required String cvFileName,
    required String jobDescription,
  });
}