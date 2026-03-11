import '../../../../../api/model/session/interview_session/interview_session_model_dto.dart';

abstract class InterviewSessionRemoteDataSource {
  Future<InterviewSessionModelDto> startInterviewSession({
    required List<int> cvBytes,
    required String cvFileName,
    required String jobDescription,
  });
}
