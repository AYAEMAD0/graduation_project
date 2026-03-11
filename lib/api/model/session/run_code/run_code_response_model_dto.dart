// run_code_response_dto.dart
import '../../../../domain/entities/session/run_code/run_code_response_entity.dart';

class TestCaseResultDto {
  final int testCaseId;
  final String? input;
  final String? expectedOutput;
  final String? actualOutput;
  final String? compileOutput;
  final String status;

  const TestCaseResultDto({
    required this.testCaseId,
    this.input,
    this.expectedOutput,
    this.actualOutput,
    this.compileOutput,
    required this.status,
  });

  factory TestCaseResultDto.fromJson(Map<String, dynamic> json) =>
      TestCaseResultDto(
        testCaseId: json['testCaseId'],
        input: json['input'],
        expectedOutput: json['expectedOutput'],
        actualOutput: json['actualOutput'],
        compileOutput: json['compileOutput'],
        status: json['status'],
      );

  TestCaseResultEntity toEntity() => TestCaseResultEntity(
    testCaseId: testCaseId,
    input: input,
    expectedOutput: expectedOutput,
    actualOutput: actualOutput,
    compileOutput: compileOutput,
    status: status,
  );
}

class RunCodeResponseDto {
  final String status;
  final int passedTestCases;
  final int totalTestCases;
  final List<TestCaseResultDto> testCaseResults;

  const RunCodeResponseDto({
    required this.status,
    required this.passedTestCases,
    required this.totalTestCases,
    required this.testCaseResults,
  });

  factory RunCodeResponseDto.fromJson(Map<String, dynamic> json) =>
      RunCodeResponseDto(
        status: json['status'],
        passedTestCases: json['passedTestCases'],
        totalTestCases: json['totalTestCases'],
        testCaseResults: (json['testCaseResults'] as List)
            .map((e) => TestCaseResultDto.fromJson(e))
            .toList(),
      );

  RunCodeResponseEntity toEntity() => RunCodeResponseEntity(
    status: status,
    passedTestCases: passedTestCases,
    totalTestCases: totalTestCases,
    testCaseResults: testCaseResults.map((e) => e.toEntity()).toList(),
  );
}
