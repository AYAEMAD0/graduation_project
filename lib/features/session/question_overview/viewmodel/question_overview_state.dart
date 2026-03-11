part of 'question_overview_cubit.dart';

class QuestionOverviewState {
  final int currentQuestion;
  final int remainingSeconds;
  final Map<int, int> selectedAnswers;

  QuestionOverviewState({
    this.currentQuestion = 0,
    this.remainingSeconds = 0,
    Map<int, int>? selectedAnswers,
  }) : selectedAnswers = selectedAnswers ?? {};

  QuestionOverviewState copyWith({
    int? currentQuestion,
    int? remainingSeconds,
    Map<int, int>? selectedAnswers,
  }) => QuestionOverviewState(
    currentQuestion: currentQuestion ?? this.currentQuestion,
    remainingSeconds: remainingSeconds ?? this.remainingSeconds,
    selectedAnswers: selectedAnswers ?? this.selectedAnswers,
  );
}
