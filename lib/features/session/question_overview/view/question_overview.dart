import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../domain/entities/interview_session/interview_session_entity.dart';
import '../../session_layout.dart';
import '../../widget/question_sidebar.dart';
import '../widget/question_content.dart';

class QuestionOverview extends StatefulWidget {
  final InterviewSessionEntity interviewSession;

  const QuestionOverview({super.key, required this.interviewSession});

  @override
  State<QuestionOverview> createState() => _QuestionOverviewState();
}

class _QuestionOverviewState extends State<QuestionOverview> {
  late int _currentQuestion;
  late int _totalQuestions;
  late int _remainingSeconds;
  Timer? _timer;
  final ScrollController _scrollController = ScrollController();
  static const double _cardHeight = 90.0;

  List<SidebarQuestion> get _sidebarQuestions => [
    ...widget.interviewSession.codingQuestions.asMap().entries.map(
      (e) => SidebarQuestion(index: e.key + 1, type: "Coding"),
    ),
    ...widget.interviewSession.mcqQuestions.asMap().entries.map(
      (e) => SidebarQuestion(
        index: e.key + widget.interviewSession.codingQuestions.length + 1,
        type: "Multiple Choice",
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _currentQuestion = 0;
    _totalQuestions =
        widget.interviewSession.codingQuestions.length +
        widget.interviewSession.mcqQuestions.length;
    _remainingSeconds = _totalQuestions * 5 * 60;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_remainingSeconds <= 0) {
        _timer?.cancel();
      } else {
        setState(() => _remainingSeconds--);
      }
    });
  }

  String get _formattedTime {
    final minutes = _remainingSeconds ~/ 60;
    final seconds = _remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void _onQuestionSelected(int index) {
    setState(() => _currentQuestion = index);
    if (index == 0) return;
    final offset = (index - 1) * _cardHeight;
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        offset.clamp(0.0, _scrollController.position.maxScrollExtent),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SessionLayout(
      time: _formattedTime,
      currentQuestion: _currentQuestion,
      totalQuestions: _totalQuestions,
      remainingSeconds: _remainingSeconds,
      questions: _sidebarQuestions,
      onQuestionSelected: _onQuestionSelected,
      body: QuestionContent(
        interviewSession: widget.interviewSession,
        currentQuestion: _currentQuestion,
        remainingSeconds: _remainingSeconds,
        onQuestionSelected: _onQuestionSelected,
        scrollController: _scrollController,
        sidebarQuestions: _sidebarQuestions,
      ),
    );
  }
}
