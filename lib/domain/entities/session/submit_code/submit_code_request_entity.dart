class SubmitCodeRequestEntity {
  final int questionId;
  final int languageId;
  final String sourceCode;

  const SubmitCodeRequestEntity({
    required this.questionId,
    required this.languageId,
    required this.sourceCode,
  });
}
