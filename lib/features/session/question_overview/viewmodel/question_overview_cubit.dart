import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

part 'question_overview_state.dart';

@injectable
class QuestionOverviewCubit extends Cubit<QuestionOverviewState> {
  Timer? _timer;
  final ScrollController scrollController = ScrollController();
  static const double cardHeight = 90.0;
  final BehaviorSubject<int> _timerStreamController = BehaviorSubject<int>();

  Stream<int> get timerStream => _timerStreamController.stream;

  final Map<int, int> _selectedAnswers = {};
  final Set<int> _savedQuestions = {};
  final Map<int, int> _savedAnswers = {};
  final Set<int> _savedCodeQuestions = {};

  Map<int, int> get answers => _selectedAnswers;

  Set<int> get savedQuestions => _savedQuestions;

  Map<int, int> get savedAnswers => _savedAnswers;

  Set<int> get savedCodeQuestions => _savedCodeQuestions;

  QuestionOverviewCubit() : super(QuestionOverviewState(selectedAnswers: {}));

  void init(int totalQuestions) {
    final seconds = totalQuestions * 1 * 60;
    _safeEmit(state.copyWith(remainingSeconds: seconds));
    _addToStream(seconds);
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (state.remainingSeconds <= 0) {
        _timer?.cancel();
        _addToStream(0);
      } else {
        final newSeconds = state.remainingSeconds - 1;
        _safeEmit(state.copyWith(remainingSeconds: newSeconds));
        _addToStream(newSeconds);
      }
    });
  }

  void _addToStream(int seconds) {
    if (!_timerStreamController.isClosed) {
      _timerStreamController.add(seconds);
    }
  }

  static String formatTime(int remainingSeconds) {
    final minutes = remainingSeconds ~/ 60;
    final seconds = remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  String get formattedTime => formatTime(state.remainingSeconds);

  void selectQuestion(int index) {
    _safeEmit(state.copyWith(currentQuestion: index));
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
    _safeEmit(state.copyWith(selectedAnswers: Map.from(_selectedAnswers)));
  }

  void markQuestionSaved(int questionId) {
    _savedQuestions.add(questionId);
    if (_selectedAnswers.containsKey(questionId)) {
      _savedAnswers[questionId] = _selectedAnswers[questionId]!;
    }
    _safeEmit(state.copyWith());
  }

  void markCodeSaved(int questionId) {
    _savedCodeQuestions.add(questionId);
    _safeEmit(state.copyWith());
  }

  void revertAnswer(int questionId, int? previousOptionId) {
    if (previousOptionId == null) {
      _selectedAnswers.remove(questionId);
    } else {
      _selectedAnswers[questionId] = previousOptionId;
    }
    _safeEmit(state.copyWith(selectedAnswers: Map.from(_selectedAnswers)));
  }

  void _safeEmit(QuestionOverviewState newState) {
    if (isClosed) return;
    emit(newState);
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    _timerStreamController.close();
    _selectedAnswers.clear();
    _savedQuestions.clear();
    _savedAnswers.clear();
    _savedCodeQuestions.clear();
    scrollController.dispose();
    return super.close();
  }
}