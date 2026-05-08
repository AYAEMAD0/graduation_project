class VoiceInterviewModelDto {
  final int sessionId;

  const VoiceInterviewModelDto({required this.sessionId});

  factory VoiceInterviewModelDto.fromJson(Map<String, dynamic> json) =>
      VoiceInterviewModelDto(sessionId: json['interviewSessionId'] as int);
}
