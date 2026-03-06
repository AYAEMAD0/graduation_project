import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_mate_ai/core/widget/custom_toast.dart';

import '../../../../core/config/di.dart';
import '../../../../domain/entities/session/interview_session/interview_session_entity.dart';
import '../../session_layout.dart';
import '../../widget/question_sidebar.dart';
import '../viewmodel/mcq_workspace_cubit.dart';
import '../widget/mcq_options_list.dart';
import '../widget/mcq_save_button.dart';

class McqWorkspace extends StatelessWidget {
  final int currentQuestion;
  final int totalQuestions;
  final int remainingSeconds;
  final List<SidebarQuestion> questions;
  final void Function(int) onQuestionSelected;
  final String questionText;
  final int questionId;
  final List<McqOptionEntity> options;
  final Map<int, int> selectedAnswers;
  final void Function(int q, int a) onAnswerSelected;
  final int sessionId;
  final bool isSaved;
  final void Function(int) onQuestionSaved;
  final Set<int> savedQuestions;

  const McqWorkspace({
    super.key,
    required this.currentQuestion,
    required this.totalQuestions,
    required this.remainingSeconds,
    required this.questions,
    required this.onQuestionSelected,
    required this.questionText,
    required this.questionId,
    required this.options,
    required this.selectedAnswers,
    required this.onAnswerSelected,
    required this.sessionId,
    required this.isSaved,
    required this.onQuestionSaved,
    required this.savedQuestions,
  });

  String get _formattedTime {
    final minutes = remainingSeconds ~/ 60;
    final seconds = remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = getIt<McqWorkspaceCubit>();
        cubit.init(
          initialOptionId: selectedAnswers[questionId],
          initialIsSaved: isSaved,
          options: options,
        );
        return cubit;
      },
      child: BlocConsumer<McqWorkspaceCubit, McqWorkspaceState>(
        listener: (context, state) {
          if (state is McqWorkspaceError) {
            CustomToast.showToast(message: state.message, context: context);
          }
        },
        builder: (context, state) {
          final cubit = context.read<McqWorkspaceCubit>();

          int? selectedIndex;

          if (state is McqWorkspaceAnswerSelected ||
              state is McqWorkspaceSaving ||
              state is McqWorkspaceSaved ||
              state is McqWorkspaceError) {
            selectedIndex = (state as dynamic).selectedIndex;
          } else {
            final savedOptionId = selectedAnswers[questionId];
            if (savedOptionId != null) {
              selectedIndex = options.indexWhere(
                    (o) => o.optionId == savedOptionId,
              );
            }
          }
          return SessionLayout(
            time: _formattedTime,
            currentQuestion: currentQuestion,
            totalQuestions: totalQuestions,
            remainingSeconds: remainingSeconds,
            questions: questions,
            onQuestionSelected: onQuestionSelected,
            selectedAnswers: selectedAnswers,
            onAnswerSelected: onAnswerSelected,
            sessionId: sessionId,
            onQuestionSaved: onQuestionSaved,
            savedQuestions: savedQuestions,
            body: Container(
              color: const Color(0xffF9FAFB),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        questionText,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: McqOptionsList(
                          options: options,
                          selectedIndex: selectedIndex,
                          isDisabled: state is McqWorkspaceSaved || isSaved,
                          onSelect: ({required index, required optionId}) {
                            cubit.selectAnswer(
                                index: index, optionId: optionId);
                            onAnswerSelected(questionId, optionId);
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      McqSaveButton(
                        isSaving: state is McqWorkspaceSaving,
                        isSaved: state is McqWorkspaceSaved || isSaved,
                        onPressed: () async {
                          await cubit.saveAnswer(
                              sessionId: sessionId, questionId: questionId);
                          onQuestionSaved(questionId);
                        },
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
