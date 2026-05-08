import 'package:injectable/injectable.dart';
import '../../../repo/session/voice/voice_interview_repo.dart';

@injectable
class StartLiveInterviewUseCase {
  final VoiceInterviewRepo _repo;

  StartLiveInterviewUseCase(this._repo);

  Future<int?> call(String track) => _repo.createSession(track);
}
