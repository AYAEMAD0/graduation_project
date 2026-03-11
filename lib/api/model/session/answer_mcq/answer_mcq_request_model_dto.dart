class AnswerMcqRequestModelDto {
  final int questionId;
  final int selectedOptionId;

  const AnswerMcqRequestModelDto({
    required this.questionId,
    required this.selectedOptionId,
  });

  Map<String, dynamic> toJson() => {
    'questionId': questionId,
    'selectedOptionId': selectedOptionId,
  };
}
