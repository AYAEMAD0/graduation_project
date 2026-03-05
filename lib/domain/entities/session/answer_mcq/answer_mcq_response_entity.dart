class AnswerMcqResponseEntity {
  final bool isCorrect;
  final int correctOptionId;

  const AnswerMcqResponseEntity({
    required this.isCorrect,
    required this.correctOptionId,
  });
}
