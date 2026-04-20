import 'package:mock_mate_ai/domain/entities/session/submit_answer/submit_answer_entity.dart';

class SubmitAnswerModelDTO {
  final int score;
  final String? feedback;

  SubmitAnswerModelDTO({
    required this.score,
    this.feedback,
  });

  factory SubmitAnswerModelDTO.fromJson(Map<String, dynamic> json) {
    return SubmitAnswerModelDTO(
      score: json['score'],
      feedback: json['feedback'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'score': score,
      'feedback': feedback,
    };
  }

  SubmitAnswerEntity toEntity() {
    return SubmitAnswerEntity(
      score: score,
      feedback: feedback,
    );
  }
}