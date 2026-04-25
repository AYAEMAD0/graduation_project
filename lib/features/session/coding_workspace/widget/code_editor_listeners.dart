import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:mock_mate_ai/core/widget/custom_toast.dart';

import '../../../../domain/entities/session/interview_session/interview_session_entity.dart';
import '../viewmodel/code_editor/code_editor_cubit.dart';
import '../viewmodel/code_editor/code_editor_state.dart';
import '../viewmodel/run_code/run_code_cubit.dart';
import '../viewmodel/run_code/run_code_state.dart';
import '../viewmodel/submit_code/submit_code_cubit.dart';
import 'build_body_code.dart';

class CodeEditorListeners extends StatelessWidget {
  final CodeController codeController;
  final List<CodeTemplateEntity> templates;
  final void Function(CodeTemplateEntity) onLanguageChanged;
  final void Function(CodeTemplateEntity) onRunCode;
  final void Function(CodeTemplateEntity) onSaveCode;
  final void Function(int langId, String code) onCodeSaved;
  final int questionId;
  final Set<int> savedCodeQuestions;

  const CodeEditorListeners({
    super.key,
    required this.codeController,
    required this.templates,
    required this.onLanguageChanged,
    required this.onRunCode,
    required this.onSaveCode,
    required this.onCodeSaved,
    required this.questionId,
    required this.savedCodeQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<RunCodeCubit, RunCodeState>(
          listener: (context, state) {
            if (state is RunCodeError) {
              CustomToast.showToast(message: state.message, context: context);
            }
          },
        ),
        BlocListener<SubmitCodeCubit, SubmitCodeState>(
          listener: (context, state) {
            if (state is SubmitCodeSuccess) {
              final editorState = context.read<CodeEditorCubit>().state;
              if (editorState is CodeEditorReady) {
                onCodeSaved(
                  editorState.selectedTemplate.languageId,
                  codeController.fullText,
                );
              }
              CustomToast.showToast(
                message: 'Saved! Score: ${state.response.score}%',
                context: context,
              );
            } else if (state is SubmitCodeError) {
              CustomToast.showToast(message: state.message, context: context);
            }
          },
        ),
      ],
      child: BlocBuilder<CodeEditorCubit, CodeEditorState>(
        builder: (context, editorState) {
          if (editorState is! CodeEditorReady) return const SizedBox();
          final template = editorState.selectedTemplate;
          return BuildBodyCode(
            template: template,
            templates: templates,
            codeController: codeController,
            showConsole: editorState.showConsole,
            onLanguageChanged: onLanguageChanged,
            onToggleConsole: () =>
                context.read<CodeEditorCubit>().toggleConsole(),
            onRunCode: () => onRunCode(template),
            onSaveCode: () => onSaveCode(template),
              questionId: questionId,
              savedCodeQuestions: savedCodeQuestions
          );
        },
      ),
    );
  }
}
