class AnswerMcqRequestEntity {
  final int questionId;
  final int selectedOptionId;

  const AnswerMcqRequestEntity({
    required this.questionId,
    required this.selectedOptionId,
  });
}
