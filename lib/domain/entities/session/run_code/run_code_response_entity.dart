class TestCaseResultEntity {
  final int testCaseId;
  final String? input;
  final String? expectedOutput;
  final String? actualOutput;
  final String? compileOutput;
  final String status;

  const TestCaseResultEntity({
    required this.testCaseId,
    this.input,
    this.expectedOutput,
    this.actualOutput,
    this.compileOutput,
    required this.status,
  });
}

class RunCodeResponseEntity {
  final String status;
  final int passedTestCases;
  final int totalTestCases;
  final List<TestCaseResultEntity> testCaseResults;

  const RunCodeResponseEntity({
    required this.status,
    required this.passedTestCases,
    required this.totalTestCases,
    required this.testCaseResults,
  });

  bool get isPassed => status == "Accepted";
}