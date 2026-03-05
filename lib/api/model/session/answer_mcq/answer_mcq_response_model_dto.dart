import '../../../../domain/entities/session/answer_mcq/answer_mcq_response_entity.dart';

class AnswerMcqResponseModelDto {
  final bool isCorrect;
  final int correctOptionId;

  const AnswerMcqResponseModelDto({
    required this.isCorrect,
    required this.correctOptionId,
  });

  factory AnswerMcqResponseModelDto.fromJson(Map<String, dynamic> json) =>
      AnswerMcqResponseModelDto(
        isCorrect: json['isCorrect'],
        correctOptionId: json['correctOptionId'],
      );

  AnswerMcqResponseEntity toEntity() => AnswerMcqResponseEntity(
    isCorrect: isCorrect,
    correctOptionId: correctOptionId,
  );
}
