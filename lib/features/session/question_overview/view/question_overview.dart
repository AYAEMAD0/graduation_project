import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/session/interview_session/interview_session_entity.dart';
import '../../model/session_arguments.dart';
import '../../session_layout.dart';
import '../../widget/question_sidebar.dart';
import '../viewmodel/question_overview_cubit.dart';
import '../widget/question_content.dart';

class QuestionOverview extends StatefulWidget {
  final InterviewSessionEntity interviewSession;

  const QuestionOverview({super.key, required this.interviewSession});

  @override
  State<QuestionOverview> createState() => _QuestionOverviewState();
}

class _QuestionOverviewState extends State<QuestionOverview> {
  late final List<SidebarQuestion> _sidebarQuestions = _buildSidebarQuestions();

  List<SidebarQuestion> _buildSidebarQuestions() => [
    ...widget.interviewSession.codingQuestions.asMap().entries.map(
      (e) => SidebarQuestion(
        index: e.key + 1,
        type: "Coding",
        questionId: e.value.questionId,
        questionText: e.value.questionText,
        questionTitle: e.value.quesTitle,
        testCases: e.value.testCases,
        templates: e.value.templates,
      ),
    ),
    ...widget.interviewSession.mcqQuestions.asMap().entries.map(
      (e) => SidebarQuestion(
        index: e.key + widget.interviewSession.codingQuestions.length + 1,
        type: "Multiple Choice",
        questionId: e.value.questionId,
        questionText: e.value.questionText,
        options: e.value.options,
      ),
    ),
  ];

  bool _computeHasUnsavedAnswer(
    QuestionOverviewState state,
    Map<int, int> savedAnswers,
    int currentQuestion,
  ) {
    final question = _sidebarQuestions.firstWhere(
      (q) => q.index == currentQuestion,
      orElse: () => SidebarQuestion(index: 0, type: ''),
    );
    if (question.type == "Coding") return false;
    final qId = question.questionId;
    if (!state.selectedAnswers.containsKey(qId)) return false;
    return state.selectedAnswers[qId] != savedAnswers[qId];
  }

  @override
  Widget build(BuildContext context) {
    final totalQuestions =
        widget.interviewSession.codingQuestions.length +
        widget.interviewSession.mcqQuestions.length;

    return BlocProvider(
      create: (context) => QuestionOverviewCubit()..init(totalQuestions),
      child: BlocBuilder<QuestionOverviewCubit, QuestionOverviewState>(
        builder: (context, state) {
          final cubit = context.read<QuestionOverviewCubit>();

          final sessionArgs = SessionArguments(
            currentQuestion: state.currentQuestion,
            totalQuestions: totalQuestions,
            remainingSeconds: state.remainingSeconds,
            questions: _sidebarQuestions,
            sessionId: widget.interviewSession.interviewSessionId,
            onQuestionSelected: cubit.selectQuestion,
            selectedAnswers: cubit.answers,
            onAnswerSelected: cubit.selectAnswer,
            savedQuestions: cubit.savedQuestions,
            onQuestionSaved: cubit.markQuestionSaved,
            hasUnsavedAnswer: _computeHasUnsavedAnswer(
              state,
              cubit.savedAnswers,
              state.currentQuestion,
            ),
            onRevertAnswer: cubit.revertAnswer,
            savedAnswers: cubit.savedAnswers,
            savedCodeQuestions: cubit.savedCodeQuestions,
            onCodeSaved: cubit.markCodeSaved,
            timerStream: cubit.timerStream,
          );

          return SessionLayout(
            time: cubit.formattedTime,
            args: sessionArgs,
            body: QuestionContent(
              interviewSession: widget.interviewSession,
              sessionArgs: sessionArgs,
              scrollController: cubit.scrollController,
            ),
          );
        },
      ),
    );
  }
}