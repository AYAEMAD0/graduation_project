import 'dart:async';

import 'package:mock_mate_ai/features/session/widget/question_sidebar.dart';

class SessionArguments {
  final int currentQuestion;
  final int totalQuestions;
  final int remainingSeconds;
  final List<SidebarQuestion> questions;
  final void Function(int index) onQuestionSelected;
  final Map<int, int> selectedAnswers;
  final void Function(int q, int a) onAnswerSelected;
  final int sessionId;
  final Set<int> savedQuestions;
  final void Function(int) onQuestionSaved;
  final bool hasUnsavedAnswer;
  final void Function(int questionId, int? previousOptionId) onRevertAnswer;
  final Map<int, int> savedAnswers;
  final Set<int> savedCodeQuestions;
  final void Function(int questionId) onCodeSaved;
  final Stream<int> timerStream;
  final bool isModified;

  const SessionArguments({
    required this.currentQuestion,
    required this.totalQuestions,
    required this.remainingSeconds,
    required this.questions,
    required this.onQuestionSelected,
    required this.selectedAnswers,
    required this.onAnswerSelected,
    required this.sessionId,
    required this.savedQuestions,
    required this.onQuestionSaved,
    required this.hasUnsavedAnswer,
    required this.onRevertAnswer,
    required this.savedAnswers,
    required this.savedCodeQuestions,
    required this.onCodeSaved,
    required this.timerStream,
    required this.isModified,
  });

  SessionArguments copyWith({
    int? currentQuestion,
    int? totalQuestions,
    int? remainingSeconds,
    List<SidebarQuestion>? questions,
    void Function(int index)? onQuestionSelected,
    Map<int, int>? selectedAnswers,
    void Function(int q, int a)? onAnswerSelected,
    int? sessionId,
    Set<int>? savedQuestions,
    void Function(int)? onQuestionSaved,
    bool? hasUnsavedAnswer,
    void Function(int, int?)? onRevertAnswer,
    Map<int, int>? savedAnswers,
    Set<int>? savedCodeQuestions,
    void Function(int)? onCodeSaved,
    Stream<int>? timerStream,
    bool? isModified,
  }) {
    return SessionArguments(
      currentQuestion: currentQuestion ?? this.currentQuestion,
      totalQuestions: totalQuestions ?? this.totalQuestions,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      questions: questions ?? this.questions,
      onQuestionSelected: onQuestionSelected ?? this.onQuestionSelected,
      selectedAnswers: selectedAnswers ?? this.selectedAnswers,
      onAnswerSelected: onAnswerSelected ?? this.onAnswerSelected,
      sessionId: sessionId ?? this.sessionId,
      savedQuestions: savedQuestions ?? this.savedQuestions,
      onQuestionSaved: onQuestionSaved ?? this.onQuestionSaved,
      hasUnsavedAnswer: hasUnsavedAnswer ?? this.hasUnsavedAnswer,
      onRevertAnswer: onRevertAnswer ?? this.onRevertAnswer,
      savedAnswers: savedAnswers ?? this.savedAnswers,
      savedCodeQuestions: savedCodeQuestions ?? this.savedCodeQuestions,
      onCodeSaved: onCodeSaved ?? this.onCodeSaved,
      timerStream: timerStream ?? this.timerStream,
      isModified: isModified ?? this.isModified,
    );
  }
}