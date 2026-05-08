abstract class VoiceInterviewWsEvent {}

class WsAiSentenceEvent extends VoiceInterviewWsEvent {
  final String text;

  WsAiSentenceEvent({required this.text});
}

class WsAiTurnCompleteEvent extends VoiceInterviewWsEvent {}

class WsInterviewResultEvent extends VoiceInterviewWsEvent {
  final double score;
  final String feedback;

  WsInterviewResultEvent({required this.score, required this.feedback});
}

class WsDisconnectedEvent extends VoiceInterviewWsEvent {}

class VoiceInterviewResultEntity {
  final int sessionId;
  final double score;
  final String feedback;

  const VoiceInterviewResultEntity({
    required this.sessionId,
    required this.score,
    required this.feedback,
  });
}
