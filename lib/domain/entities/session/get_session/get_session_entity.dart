class GetSessionEntity {
  final int interviewSessionId;
  final int userId;
  final String userName;
  final double score;
  final String startDate;
  final String? endDate;
  final String? feedback;

  const GetSessionEntity({
    required this.interviewSessionId,
    required this.userId,
    required this.userName,
    required this.score,
    required this.startDate,
    this.endDate,
    this.feedback,
  });
}
