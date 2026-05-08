import 'package:injectable/injectable.dart';

import '../../../entities/session/voice/voice_interview_entity.dart';
import '../../../repo/session/voice/voice_interview_repo.dart';

@injectable
class SubmitLiveInterviewUseCase {
  final VoiceInterviewRepo _repo;

  SubmitLiveInterviewUseCase(this._repo);

  Future<void> call(VoiceInterviewResultEntity result) => _repo.submitResult(
    sessionId: result.sessionId,
    score: result.score,
    feedback: result.feedback,
  );
}
