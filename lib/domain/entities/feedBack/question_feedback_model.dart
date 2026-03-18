class QuestionFeedbackModel {
  final String questionTitle;
  final String feedback;
  final String suggestion;

  QuestionFeedbackModel({
    required this.questionTitle,
    required this.feedback,
    required this.suggestion,
  });

  factory QuestionFeedbackModel.fromJson(Map<String, dynamic> json) {
    return QuestionFeedbackModel(
      questionTitle: json['questionTitle'],
      feedback: json['feedback'],
      suggestion: json['suggestion'],
    );
  }
}