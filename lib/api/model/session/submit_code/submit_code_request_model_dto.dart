class SubmitCodeRequestModelDto {
  final int questionId;
  final int languageId;
  final String sourceCode;

  const SubmitCodeRequestModelDto({
    required this.questionId,
    required this.languageId,
    required this.sourceCode,
  });

  Map<String, dynamic> toJson() => {
    'questionId': questionId,
    'languageId': languageId,
    'sourceCode': sourceCode,
  };
}
