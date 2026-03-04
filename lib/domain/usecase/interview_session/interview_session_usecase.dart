import 'package:injectable/injectable.dart';
import '../../entities/interview_session/interview_session_entity.dart';
import '../../repo/interview_session/interview_session_repo.dart';

@injectable
class InterviewSessionUseCase {
  final InterviewSessionRepo interviewSessionRepo;

  InterviewSessionUseCase(this.interviewSessionRepo);

  Future<InterviewSessionEntity> call({
    required List<int> cvBytes,
    required String cvFileName,
    required String jobDescription,
  }) {
    return interviewSessionRepo.startInterview(
      cvBytes: cvBytes,
      cvFileName: cvFileName,
      jobDescription: jobDescription,
    );
  }
}
