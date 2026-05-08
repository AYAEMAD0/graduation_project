enum VoiceInterviewStatus { initial, connected, evaluating, done }

class VoiceInterviewState {
  final VoiceInterviewStatus status;
  final bool isListening;
  final bool isAiSpeaking;
  final int remainingSeconds;
  final int? sessionId;

  const VoiceInterviewState({
    this.status = VoiceInterviewStatus.initial,
    this.isListening = false,
    this.isAiSpeaking = false,
    this.remainingSeconds = 900,
    this.sessionId,
  });

  bool get isConnected => status == VoiceInterviewStatus.connected;

  bool get isEvaluating => status == VoiceInterviewStatus.evaluating;

  VoiceInterviewState copyWith({
    VoiceInterviewStatus? status,
    bool? isListening,
    bool? isAiSpeaking,
    int? remainingSeconds,
    int? sessionId,
  }) {
    return VoiceInterviewState(
      status: status ?? this.status,
      isListening: isListening ?? this.isListening,
      isAiSpeaking: isAiSpeaking ?? this.isAiSpeaking,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      sessionId: sessionId ?? this.sessionId,
    );
  }
}
