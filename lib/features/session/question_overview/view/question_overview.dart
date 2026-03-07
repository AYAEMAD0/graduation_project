import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/session/interview_session/interview_session_entity.dart';
import '../../model/session_arguments.dart';
import '../../session_layout.dart';
import '../../widget/question_sidebar.dart';
import '../viewmodel/question_overview_cubit.dart';
import '../widget/question_content.dart';

class QuestionOverview extends StatelessWidget {
  final InterviewSessionEntity interviewSession;

  const QuestionOverview({super.key, required this.interviewSession});

  List<SidebarQuestion> _buildSidebarQuestions() => [
    ...interviewSession.codingQuestions.asMap().entries.map(
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
    ...interviewSession.mcqQuestions.asMap().entries.map(
      (e) => SidebarQuestion(
        index: e.key + interviewSession.codingQuestions.length + 1,
        type: "Multiple Choice",
        questionId: e.value.questionId,
        questionText: e.value.questionText,
        options: e.value.options,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final totalQuestions =
        interviewSession.codingQuestions.length +
        interviewSession.mcqQuestions.length;
    final sidebarQuestions = _buildSidebarQuestions();

    return BlocProvider(
      create: (context) => QuestionOverviewCubit()..init(totalQuestions),
      child: BlocBuilder<QuestionOverviewCubit, QuestionOverviewState>(
        builder: (context, state) {
          final cubit = context.read<QuestionOverviewCubit>();

          final sessionArgs = SessionArguments(
            currentQuestion: state.currentQuestion,
            totalQuestions: totalQuestions,
            remainingSeconds: state.remainingSeconds,
            questions: sidebarQuestions,
            sessionId: interviewSession.interviewSessionId,
            onQuestionSelected: cubit.selectQuestion,
            selectedAnswers: cubit.answers,
            onAnswerSelected: cubit.selectAnswer,
            savedQuestions: cubit.savedQuestions,
            onQuestionSaved: cubit.markQuestionSaved,
            hasUnsavedAnswer: false,
            onRevertAnswer: cubit.revertAnswer,
            savedAnswers: cubit.savedAnswers,
            savedCodeQuestions: cubit.savedCodeQuestions,
            onCodeSaved: cubit.markCodeSaved,
          );

          return SessionLayout(
            time: cubit.formattedTime,
            args: sessionArgs,
            body: QuestionContent(
              interviewSession: interviewSession,
              sessionArgs: sessionArgs,
              scrollController: cubit.scrollController,
            ),
          );
        },
      ),
    );
  }
}