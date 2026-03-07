import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'question_overview_state.dart';

@injectable
class QuestionOverviewCubit extends Cubit<QuestionOverviewState> {
  Timer? _timer;
  final ScrollController scrollController = ScrollController();
  static const double cardHeight = 90.0;
  static final Map<int, int> _selectedAnswers = {};

  Map<int, int> get answers => _selectedAnswers;

  QuestionOverviewCubit()
    : super(QuestionOverviewState(selectedAnswers: _selectedAnswers));

  void init(int totalQuestions) {
    final seconds = totalQuestions * 5 * 60;
    emit(state.copyWith(remainingSeconds: seconds));
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (state.remainingSeconds <= 0) {
        _timer?.cancel();
      } else {
        emit(state.copyWith(remainingSeconds: state.remainingSeconds - 1));
      }
    });
  }

  String get formattedTime {
    final minutes = state.remainingSeconds ~/ 60;
    final seconds = state.remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void selectQuestion(int index) {
    emit(state.copyWith(currentQuestion: index));
    if (index == 0) return;
    final offset = (index - 1) * cardHeight;
    if (scrollController.hasClients) {
      scrollController.animateTo(
        offset.clamp(0.0, scrollController.position.maxScrollExtent),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void selectAnswer(int questionId, int answerId) {
    _selectedAnswers[questionId] = answerId;
    emit(state.copyWith(selectedAnswers: _selectedAnswers));
  }

  static final Set<int> _savedQuestions = {};
  Set<int> get savedQuestions => _savedQuestions;
  static final Map<int, int> _savedAnswers = {};

  Map<int, int> get savedAnswers => _savedAnswers;

  void markQuestionSaved(int questionId) {
    _savedQuestions.add(questionId);
    if (_selectedAnswers.containsKey(questionId)) {
      _savedAnswers[questionId] = _selectedAnswers[questionId]!;
    }
  }

  void revertAnswer(int questionId, int? previousOptionId) {
    if (previousOptionId == null) {
      _selectedAnswers.remove(questionId);
    } else {
      _selectedAnswers[questionId] = previousOptionId;
    }
    emit(state.copyWith(selectedAnswers: _selectedAnswers));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    _selectedAnswers.clear();
    _savedQuestions.clear();
    _savedAnswers.clear();
    scrollController.dispose();
    return super.close();
  }
}
