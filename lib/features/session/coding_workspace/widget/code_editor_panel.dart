import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:highlight/languages/cpp.dart';
import 'package:highlight/languages/cs.dart';
import 'package:highlight/languages/java.dart';
import 'package:highlight/languages/python.dart';

import '../../../../domain/entities/session/interview_session/interview_session_entity.dart';
import '../../../../domain/entities/session/run_code/run_code_request_entity.dart';
import '../../../../domain/entities/session/submit_code/submit_code_request_entity.dart';
import '../viewmodel/code_editor/code_editor_cubit.dart';
import '../viewmodel/run_code/run_code_cubit.dart';
import '../viewmodel/submit_code/submit_code_cubit.dart';
import 'code_editor_listeners.dart';

class CodeEditor extends StatefulWidget {
  final List<CodeTemplateEntity> templates;
  final List<TestCaseEntity> testCases;
  final int sessionId;
  final int questionId;
  final Map<int, String> savedCode;
  final int? savedLanguageId;
  final void Function(int langId, String code) onCodeChanged;
  final void Function(int langId, String code) onCodeSaved;
  final void Function(int langId) onCodeReverted;
  final Set<int> savedCodeQuestions;

  const CodeEditor({
    super.key,
    required this.templates,
    required this.testCases,
    required this.sessionId,
    required this.questionId,
    required this.savedCode,
    required this.onCodeChanged,
    required this.onCodeSaved,
    required this.onCodeReverted,
    required this.savedCodeQuestions,
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
    final initialCode =
        widget.savedCode[template.languageId] ?? template.defaultCode;
    _codeController = CodeController(
      text: initialCode,
      language: _langMap[template.languageId] ?? python,
    );
    _codeController.addListener(() {
      final current = _codeController.fullText;
      if (current == initialCode) {
        widget.onCodeReverted(template.languageId);
        return;
      }
      widget.onCodeChanged(template.languageId, current);
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
    return CodeEditorListeners(
      codeController: _codeController,
      templates: widget.templates,
      onLanguageChanged: _onLanguageChanged,
      onRunCode: _runCode,
      onSaveCode: _saveCode,
      onCodeSaved: widget.onCodeSaved,
        questionId: widget.questionId,
        savedCodeQuestions: widget.savedCodeQuestions
    );
  }
}