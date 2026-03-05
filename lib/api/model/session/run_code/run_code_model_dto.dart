import '../../../../domain/entities/session/run_code/run_code_response_entity.dart';

class RunCodeRequestDto {
  final int questionId;
  final int languageId;
  final String sourceCode;

  const RunCodeRequestDto({
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

class RunCodeResponseDto {
  final String status;
  final String output;
  final String? error;

  const RunCodeResponseDto({
    required this.status,
    required this.output,
    this.error,
  });

  factory RunCodeResponseDto.fromJson(Map<String, dynamic> json) =>
      RunCodeResponseDto(
        status: json['status'],
        output: json['output'],
        error: json['error'],
      );

  RunCodeResponseEntity toEntity() =>
      RunCodeResponseEntity(status: status, output: output, error: error);
}
