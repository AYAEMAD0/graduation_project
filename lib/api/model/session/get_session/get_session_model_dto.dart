import 'package:mock_mate_ai/domain/entities/session/get_session/get_session_entity.dart';

class GetSessionModelDto {
  final int interviewSessionId;
  final int userId;
  final String userName;
  final double score;
  final String startDate;
  final String? endDate;
  final String? feedback;

  const GetSessionModelDto({
    required this.interviewSessionId,
    required this.userId,
    required this.userName,
    required this.score,
    required this.startDate,
    this.endDate,
    this.feedback,
  });

  factory GetSessionModelDto.fromJson(Map<String, dynamic> json) =>
      GetSessionModelDto(
        interviewSessionId: json['interviewSessionId'],
        userId: json['userId'],
        userName: json['userName'],
        score: (json['score'] as num).toDouble(),
        startDate: json['startDate'],
        endDate: json['endDate'],
        feedback: json['feedback'],
      );

  GetSessionEntity toEntity() => GetSessionEntity(
    interviewSessionId: interviewSessionId,
    userId: userId,
    userName: userName,
    score: score,
    startDate: startDate,
    endDate: endDate,
    feedback: feedback,
  );
}
