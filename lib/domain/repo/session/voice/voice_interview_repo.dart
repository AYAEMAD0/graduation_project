import '../../../entities/session/voice/voice_interview_entity.dart';

abstract class VoiceInterviewRepo {
  Stream<VoiceInterviewWsEvent> get wsEvents;

  Future<int?> createSession(String track);

  Future<void> submitResult({
    required int sessionId,
    required double score,
    required String feedback,
  });

  void connectWebSocket({required String token, required String track});

  void sendWsEvent(Map<String, dynamic> payload);

  void disconnectWebSocket();
}
