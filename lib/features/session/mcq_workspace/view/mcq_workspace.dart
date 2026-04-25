import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_mate_ai/core/widget/custom_toast.dart';

import '../../../../core/config/di.dart';
import '../../../../domain/entities/session/interview_session/interview_session_entity.dart';
import '../../model/session_arguments.dart';
import '../../session_layout.dart';
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
              '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(
              2, '0')}';

          return BlocProvider(
            create: (_) {
              final cubit = getIt<McqWorkspaceCubit>();
              cubit.init(
                initialOptionId: args.savedAnswers[questionId],
                initialIsSaved: isSaved,
                options: options,
              );
              return cubit;
            },
            child: BlocConsumer<McqWorkspaceCubit, McqWorkspaceState>(
              listener: (context, state) {
                if (state is McqWorkspaceError) {
                  CustomToast.showToast(
                      message: state.message, context: context);
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
                  args: args.copyWith(
                    hasUnsavedAnswer: hasUnsavedAnswer,
                  ),
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
                                onSelect: (
                                    {required index, required optionId}) {
                                  cubit.selectAnswer(
                                      index: index, optionId: optionId);
                                  args.onAnswerSelected(questionId, optionId);
                                },
                              ),
                            ),
                            const SizedBox(height: 30),
                            McqSaveButton(
                              isSaving: state is McqWorkspaceSaving,
                              isSaved: state is McqWorkspaceSaved,
                              onPressed: () async {
                                if (state is McqWorkspaceInitial) {
                                  CustomToast.showToast(
                                      message: "Please select an option first",
                                      context: context);
                                  return;
                                }
                                await cubit.saveAnswer(
                                    sessionId: args.sessionId,
                                    questionId: questionId);
                                args.onQuestionSaved(questionId);
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
    );
  }
}