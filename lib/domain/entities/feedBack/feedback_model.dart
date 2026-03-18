import 'package:mock_mate_ai/domain/entities/feedBack/question_feedback_model.dart';

class FeedbackModel {
  final String overallSummary;
  final List<String> strengths;
  final List<String> weaknesses;
  final List<QuestionFeedbackModel> detailedFeedback;

  FeedbackModel({
    required this.overallSummary,
    required this.strengths,
    required this.weaknesses,
    required this.detailedFeedback,
  });

  factory FeedbackModel.fromJson(Map<String, dynamic> json) {
    return FeedbackModel(
      overallSummary: json['overallSummary'],
      strengths: List<String>.from(json['strengths']),
      weaknesses: List<String>.from(json['weaknesses']),
      detailedFeedback: (json['detailedFeedback'] as List)
          .map((e) => QuestionFeedbackModel.fromJson(e))
          .toList(),
    );
  }
}