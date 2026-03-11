class AnswerMcqResponseEntity {
  final int sessionAnswerId;
  final bool success;

  const AnswerMcqResponseEntity({
    required this.sessionAnswerId,
    required this.success,
  });
}