import '../../../../domain/entities/session/answer_mcq/answer_mcq_response_entity.dart';

class AnswerMcqResponseModelDto {
  final int sessionAnswerId;
  final bool success;

  const AnswerMcqResponseModelDto({
    required this.sessionAnswerId,
    required this.success,
  });

  factory AnswerMcqResponseModelDto.fromJson(Map<String, dynamic> json) =>
      AnswerMcqResponseModelDto(
        sessionAnswerId: json['sessionAnswerId'],
        success: json['success'],
      );

  AnswerMcqResponseEntity toEntity() => AnswerMcqResponseEntity(
    sessionAnswerId: sessionAnswerId,
    success: success,
  );
}