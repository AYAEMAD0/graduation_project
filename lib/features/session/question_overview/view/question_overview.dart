import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_mate_ai/core/config/di.dart';
import 'package:mock_mate_ai/core/routes/app_routes.dart';
import 'package:mock_mate_ai/core/widget/custom_dialog.dart';
import 'package:mock_mate_ai/features/session/question_overview/viewmodel/submit_answer_cubit.dart';

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

  bool _computeIsModified(
    Set<int> savedCodeQuestions,
    Map<int, int> savedAnswers,
    int currentQuestion,
  ) {
    final question = _sidebarQuestions.firstWhere(
      (q) => q.index == currentQuestion,
      orElse: () => SidebarQuestion(index: 0, type: ''),
    );
    final qId = question.questionId;
    if (question.type == "Coding") {
      return savedCodeQuestions.contains(qId);
    } else {
      return savedAnswers.containsKey(qId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final totalQuestions =
        widget.interviewSession.codingQuestions.length +
        widget.interviewSession.mcqQuestions.length;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => QuestionOverviewCubit()..init(totalQuestions),
        ),
        BlocProvider(create: (context) => getIt<SubmitAnswerCubit>()),
      ],
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
            isModified: _computeIsModified(
              cubit.savedCodeQuestions,
              cubit.savedAnswers,
              state.currentQuestion,
            ),
          );

          return PopScope(
            canPop: false,

            onPopInvoked: (didPop) async {
              if (didPop) return;

              final confirmed = await CustomDialog.showConfirm(
                context: context,
                title: "Leave Session?",

                message:
                    "Your current progress will be submitted if you leave this session.\n\n"
                    "Do you want to continue?",

                confirmText: "Submit & Leave",
                cancelText: "Stay",
              );

              if (confirmed != true) return;

              try {
                await context.read<SubmitAnswerCubit>().submitAnswer(
                  widget.interviewSession.interviewSessionId,
                );

                if (!context.mounted) return;

                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.feedback,
                  (route) => false,
                  arguments: widget.interviewSession.interviewSessionId,
                );
              } catch (_) {}
            },

            child: SessionLayout(
              time: cubit.formattedTime,
              args: sessionArgs,
              body: QuestionContent(
                interviewSession: widget.interviewSession,
                sessionArgs: sessionArgs,
                scrollController: cubit.scrollController,
              ),
            ),
          );
        },
      ),
    );
  }
}
