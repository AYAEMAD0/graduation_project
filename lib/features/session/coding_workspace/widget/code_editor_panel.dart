import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:highlight/languages/cpp.dart';
import 'package:highlight/languages/cs.dart';
import 'package:highlight/languages/java.dart';
import 'package:highlight/languages/python.dart';
import 'package:mock_mate_ai/core/widget/custom_toast.dart';

import '../../../../domain/entities/session/interview_session/interview_session_entity.dart';
import '../../../../domain/entities/session/run_code/run_code_request_entity.dart';
import '../../../../domain/entities/session/submit_code/submit_code_request_entity.dart';
import '../viewmodel/code_editor/code_editor_cubit.dart';
import '../viewmodel/code_editor/code_editor_state.dart';
import '../viewmodel/run_code/run_code_cubit.dart';
import '../viewmodel/run_code/run_code_state.dart';
import '../viewmodel/submit_code/submit_code_cubit.dart';
import 'build_body_code.dart';

class CodeEditor extends StatefulWidget {
  final List<CodeTemplateEntity> templates;
  final List<TestCaseEntity> testCases;
  final int sessionId;
  final int questionId;
  final Map<int, String> savedCode;
  final void Function(int, String) onCodeChanged;
  final int? savedLanguageId;

  const CodeEditor({
    super.key,
    required this.templates,
    required this.testCases,
    required this.sessionId,
    required this.questionId,
    required this.savedCode,
    required this.onCodeChanged,
    this.savedLanguageId,
  });

  @override
  State<CodeEditor> createState() => _CodeEditorState();
}

class _CodeEditorState extends State<CodeEditor> {
  late CodeController _codeController;
  final _langMap = {51: cs, 54: cpp, 62: java, 71: python};

  @override
  void initState() {
    super.initState();
    final initial = widget.templates.firstWhere(
      (t) => t.languageId == widget.savedLanguageId,
      orElse: () => widget.templates.first,
    );
    context.read<CodeEditorCubit>().init(initial);
    _initController(initial);
  }

  void _initController(CodeTemplateEntity template) {
    final code = widget.savedCode[template.languageId] ?? template.defaultCode;
    _codeController = CodeController(
      text: code,
      language: _langMap[template.languageId] ?? python,
    );
    _codeController.addListener(() {
      widget.onCodeChanged(template.languageId, _codeController.fullText);
    });
  }

  void _onLanguageChanged(CodeTemplateEntity template) {
    _codeController.dispose();
    _initController(template);
    context.read<CodeEditorCubit>().changeTemplate(template);
  }

  void _runCode(CodeTemplateEntity template) {
    context.read<CodeEditorCubit>().showConsolePanel();
    context.read<RunCodeCubit>().runCode(
      sessionId: widget.sessionId,
      entity: RunCodeRequestEntity(
        questionId: widget.questionId,
        languageId: template.languageId,
        sourceCode: _codeController.fullText,
      ),
    );
  }

  void _saveCode(CodeTemplateEntity template) {
    context.read<SubmitCodeCubit>().submitCode(
      sessionId: widget.sessionId,
      entity: SubmitCodeRequestEntity(
        questionId: widget.questionId,
        languageId: template.languageId,
        sourceCode: _codeController.fullText,
      ),
    );
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

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
            onLanguageChanged: _onLanguageChanged,
            codeController: _codeController,
            templates: widget.templates,
            showConsole: editorState.showConsole,
            onToggleConsole: () =>
                context.read<CodeEditorCubit>().toggleConsole(),
            onRunCode: () => _runCode(template),
            onSaveCode: () => _saveCode(template),
          );
        },
      ),
    );
  }
}
