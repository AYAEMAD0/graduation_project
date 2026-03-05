class SubmitCodeResponseEntity {
  final int sessionAnswerId;
  final String status;
  final int score;
  final int passedTestCases;
  final int totalTestCases;

  const SubmitCodeResponseEntity({
    required this.sessionAnswerId,
    required this.status,
    required this.score,
    required this.passedTestCases,
    required this.totalTestCases,
  });
}
