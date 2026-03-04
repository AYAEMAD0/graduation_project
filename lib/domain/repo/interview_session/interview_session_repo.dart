import '../../entities/interview_session/interview_session_entity.dart';

abstract class InterviewSessionRepo {
  Future<InterviewSessionEntity> startInterview({
    required List<int> cvBytes,
    required String cvFileName,
    required String jobDescription,
  });
}
