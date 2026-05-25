import '../../../../../api/model/session/voice/voice_interview_model_dto.dart';
import '../../../../../domain/entities/session/voice/voice_interview_entity.dart';

abstract class VoiceInterviewRemoteDataSource {
  Stream<VoiceInterviewWsEvent> get wsEvents;

  Future<VoiceInterviewModelDto> createSession(String track);

  Future<void> submitResult({
    required int sessionId,
    required double score,
    required String feedback,
  });

  Future<void> connectWebSocket({required String token, required String track});
  void sendWsEvent(Map<String, dynamic> payload);

  void disconnectWebSocket();
}
