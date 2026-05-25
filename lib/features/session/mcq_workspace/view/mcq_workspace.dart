import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_mate_ai/core/routes/app_routes.dart';
import 'package:mock_mate_ai/core/widget/custom_toast.dart';

import '../../../../core/config/di.dart';
import '../../../../domain/entities/session/interview_session/interview_session_entity.dart';
import '../../model/session_arguments.dart';
import '../../session_layout.dart';
import '../../widget/question_sidebar.dart';
import '../viewmodel/mcq_workspace_cubit.dart';
import '../widget/mcq_options_list.dart';
import '../widget/mcq_save_button.dart';

class McqWorkspace extends StatelessWidget {
  final SessionArguments args;
  final String questionText;
  final int questionId;
  final List<McqOptionEntity> options;
  final bool isSaved;

  const McqWorkspace({
    super.key,
    required this.args,
    required this.questionText,
    required this.questionId,
    required this.options,
    required this.isSaved,
  });

  void _goToNextQuestion(BuildContext context) {
    final nextIndex = args.currentQuestion + 1;
    if (nextIndex > args.totalQuestions) {
      args.onQuestionSelected(0);
      Navigator.popUntil(
        context,
        ModalRoute.withName(AppRoutes.questionOverview),
      );
      return;
    }

    final question = args.questions.firstWhere(
      (q) => q.index == nextIndex,
      orElse: () => SidebarQuestion(index: nextIndex, type: ''),
    );

    final sessionArgs = args.copyWith(currentQuestion: nextIndex);
    args.onQuestionSelected(nextIndex);

    final baseArgs = {
      'sessionArgs': sessionArgs,
      'savedCode': question.savedCode,
      'savedLanguageId': question.savedLanguageId,
      'onCodeChanged': (int langId, String code) {
        question.tempCode[langId] = code;
        question.tempLanguageId = langId;
      },
      'onCodeSaved': (int langId, String code) {
        question.savedCode[langId] = code;
        question.savedLanguageId = langId;
        question.tempCode.clear();
        question.tempLanguageId = null;
        args.onCodeSaved(question.questionId);
      },
      'onCodeReverted': (int langId) {
        question.tempCode.remove(langId);
      },
    };

    if (question.type == "Coding") {
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.codeWorkspace,
        arguments: {
          ...baseArgs,
          'questionId': question.questionId,
          'questionTitle': question.questionTitle,
          'questionText': question.questionText,
          'testCases': question.testCases,
          'templates': question.templates,
        },
      );
    } else {
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.mcqWorkspace,
        arguments: {
          ...baseArgs,
          'questionId': question.questionId,
          'questionText': question.questionText,
          'options': question.options,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: args.timerStream,
      initialData: args.remainingSeconds,
      builder: (context, snapshot) {
        final seconds = snapshot.data ?? args.remainingSeconds;
        final minutes = seconds ~/ 60;
        final secs = seconds % 60;
        final time =
            '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';

        return BlocProvider(
          create: (_) {
            final cubit = getIt<McqWorkspaceCubit>();
            cubit.init(
              initialOptionId:
                  args.selectedAnswers[questionId] ??
                  args.savedAnswers[questionId],
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
              final hasUnsavedAnswer = state is McqWorkspaceAnswerSelected;
              int? selectedIndex;

              if (state is McqWorkspaceAnswerSelected ||
                  state is McqWorkspaceSaving ||
                  state is McqWorkspaceSaved ||
                  state is McqWorkspaceError) {
                selectedIndex = (state as dynamic).selectedIndex;
              } else {
                final savedOptionId = args.savedAnswers[questionId];
                if (savedOptionId != null) {
                  selectedIndex = options.indexWhere(
                    (o) => o.optionId == savedOptionId,
                  );
                }
              }

              return SessionLayout(
                time: time,
                args: args.copyWith(hasUnsavedAnswer: hasUnsavedAnswer),
                body: Container(
                  color: const Color(0xffF9FAFB),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              questionText,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 15),
                            McqOptionsList(
                              options: options,
                              selectedIndex: selectedIndex,
                              onSelect: ({required index, required optionId}) {
                                cubit.selectAnswer(
                                  index: index,
                                  optionId: optionId,
                                );
                                args.onAnswerSelected(questionId, optionId);
                              },
                            ),
                            const SizedBox(height: 15),
                            McqSaveButton(
                              isSaving: state is McqWorkspaceSaving,
                              isSaved: state is McqWorkspaceSaved,
                              onPressed: () async {
                                if (state is McqWorkspaceInitial) {
                                  CustomToast.showToast(
                                    message: "Please select an option first",
                                    context: context,
                                  );
                                  return;
                                }

                                if (state is McqWorkspaceSaved) {
                                  if (context.mounted) {
                                    _goToNextQuestion(context);
                                  }
                                  return;
                                }

                                await cubit.saveAnswer(
                                  sessionId: args.sessionId,
                                  questionId: questionId,
                                );
                                args.onQuestionSaved(questionId);

                                if (context.mounted) {
                                  _goToNextQuestion(context);
                                }
                              },
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
