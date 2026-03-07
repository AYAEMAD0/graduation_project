import '../../../../domain/entities/session/submit_code/submit_code_response_entity.dart';
import '../run_code/run_code_ request_model_dto.dart';

class SubmitCodeResponseModelDto {
  final int sessionAnswerId;
  final String status;
  final double score;
  final int passedTestCases;
  final int totalTestCases;
  final List<TestCaseResultDto> testCaseResults;

  const SubmitCodeResponseModelDto({
    required this.sessionAnswerId,
    required this.status,
    required this.score,
    required this.passedTestCases,
    required this.totalTestCases,
    required this.testCaseResults,
  });

  factory SubmitCodeResponseModelDto.fromJson(Map<String, dynamic> json) =>
      SubmitCodeResponseModelDto(
        sessionAnswerId: json['sessionAnswerId'],
        status: json['status'],
        score: (json['score'] as num).toDouble(),
        passedTestCases: json['passedTestCases'],
        totalTestCases: json['totalTestCases'],
        testCaseResults: (json['testCaseResults'] as List)
            .map((e) => TestCaseResultDto.fromJson(e))
            .toList(),
      );

  SubmitCodeResponseEntity toEntity() => SubmitCodeResponseEntity(
    sessionAnswerId: sessionAnswerId,
    status: status,
    score: score,
    passedTestCases: passedTestCases,
    totalTestCases: totalTestCases,
    testCaseResults: testCaseResults.map((e) => e.toEntity()).toList(),
  );
}