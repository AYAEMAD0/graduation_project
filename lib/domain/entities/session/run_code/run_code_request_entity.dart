class RunCodeRequestEntity {
  final int questionId;
  final int languageId;
  final String sourceCode;

  const RunCodeRequestEntity({
    required this.questionId,
    required this.languageId,
    required this.sourceCode,
  });
}
