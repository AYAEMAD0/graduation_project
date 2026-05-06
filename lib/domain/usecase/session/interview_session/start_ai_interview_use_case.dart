import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/domain/entities/session/interview_session/interview_session_entity.dart';
import 'package:mock_mate_ai/domain/repo/session/interview_session/ai_interview_repo.dart';

@injectable
class StartAiInterviewUseCase {
  final AiInterviewRepo aiInterviewRepo ;
  StartAiInterviewUseCase(this.aiInterviewRepo);

  Future<InterviewSessionEntity> call({
    required List<int> cvBytes,
    required String cvFileName,
    required String jobDescription
}){
    return aiInterviewRepo.startAiInterview(
        cvBytes: cvBytes,
        cvFileName: cvFileName,
        jobDescription: jobDescription);
  }
}