import '../../../../domain/entities/session/submit_code/submit_code_response_entity.dart';

class SubmitCodeResponseModelDto {
  final int sessionAnswerId;
  final String status;
  final int score;
  final int passedTestCases;
  final int totalTestCases;

  const SubmitCodeResponseModelDto({
    required this.sessionAnswerId,
    required this.status,
    required this.score,
    required this.passedTestCases,
    required this.totalTestCases,
  });

  factory SubmitCodeResponseModelDto.fromJson(Map<String, dynamic> json) =>
      SubmitCodeResponseModelDto(
        sessionAnswerId: json['sessionAnswerId'],
        status: json['status'],
        score: json['score'],
        passedTestCases: json['passedTestCases'],
        totalTestCases: json['totalTestCases'],
      );

  SubmitCodeResponseEntity toEntity() => SubmitCodeResponseEntity(
    sessionAnswerId: sessionAnswerId,
    status: status,
    score: score,
    passedTestCases: passedTestCases,
    totalTestCases: totalTestCases,
  );
}
