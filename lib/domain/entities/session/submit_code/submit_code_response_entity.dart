import '../run_code/run_code_response_entity.dart';

class SubmitCodeResponseEntity {
  final int sessionAnswerId;
  final String status;
  final double score;
  final int passedTestCases;
  final int totalTestCases;
  final List<TestCaseResultEntity> testCaseResults;

  const SubmitCodeResponseEntity({
    required this.sessionAnswerId,
    required this.status,
    required this.score,
    required this.passedTestCases,
    required this.totalTestCases,
    required this.testCaseResults,
  });

  bool get isPassed => status == 'Passed';
}