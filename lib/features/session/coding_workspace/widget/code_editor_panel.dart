import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:highlight/languages/cpp.dart';
import 'package:highlight/languages/cs.dart';
import 'package:highlight/languages/java.dart';
import 'package:highlight/languages/python.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';
import 'package:mock_mate_ai/core/widget/custom_toast.dart';

import '../../../../domain/entities/session/interview_session/interview_session_entity.dart';
import '../../viewmodel/submit_code/submit_code_cubit.dart';

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
  late CodeTemplateEntity _selectedTemplate;
  final Color backgroundColor = const Color(0xFF0E141E);
  bool _isRunning = false;
  String _consoleOutput = '';
  List<Map<String, dynamic>> _testResults = [];
  bool _showConsole = false;
  final _langMap = {51: cs, 54: cpp, 62: java, 71: python};

  @override
  void initState() {
    super.initState();
    _selectedTemplate = widget.templates.firstWhere(
      (t) => t.languageId == widget.savedLanguageId,
      orElse: () => widget.templates.first,
    );
    _initController(_selectedTemplate);
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
    setState(() {
      _selectedTemplate = template;
      _codeController.dispose();
      final code =
          widget.savedCode[template.languageId] ?? template.defaultCode;
      _codeController = CodeController(
        text: code,
        language: _langMap[template.languageId] ?? python,
      );
      _codeController.addListener(() {
        widget.onCodeChanged(template.languageId, _codeController.fullText);
      });
    });
  }

  Future<void> _runCode() async {
    setState(() {
      _isRunning = true;
      _showConsole = true;
      _consoleOutput = '⏳ Running...';
      _testResults = [];
    });

    context.read<SubmitCodeCubit>().submitCode(
      sessionId: widget.sessionId,
      questionId: widget.questionId,
      languageId: _selectedTemplate.languageId,
      sourceCode: _codeController.fullText,
      isFinalSubmit: false,
    );
  }

  void _saveCode({required bool isFinalSubmit}) {
    context.read<SubmitCodeCubit>().submitCode(
      sessionId: widget.sessionId,
      questionId: widget.questionId,
      languageId: _selectedTemplate.languageId,
      sourceCode: _codeController.fullText,
      isFinalSubmit: isFinalSubmit,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SubmitCodeCubit, SubmitCodeState>(
      listener: (context, state) {
        if (state is SubmitCodeSuccess) {
          final r = state.response;
          setState(() {
            _isRunning = false;
            _showConsole = true;
            _testResults = List.generate(
              r.totalTestCases,
              (i) => {'passed': i < r.passedTestCases},
            );
            _consoleOutput =
                '${r.status == 'Passed' ? '✅' : '❌'} ${r.status}\n'
                '📊 Score: ${r.score}%\n'
                '✓ Passed: ${r.passedTestCases}/${r.totalTestCases}';
          });
          if (state.isFinalSubmit) {
            CustomToast.showToast(
              message: r.status == 'Passed'
                  ? '✅ Submitted! Score: ${r.score}%'
                  : '❌ Submitted! Score: ${r.score}%',
              context: context,
            );
          }
        } else if (state is SubmitCodeError) {
          setState(() => _isRunning = false);
          CustomToast.showToast(message: state.message, context: context);
        }
      },
      child: Container(
        color: backgroundColor,
        child: Column(
          children: [
            _buildToolbar(),
            Expanded(
              child: CodeTheme(
                data: CodeThemeData(styles: monokaiSublimeTheme),
                child: Container(
                  decoration: BoxDecoration(color: backgroundColor),
                  child: SingleChildScrollView(
                    child: CodeField(
                      controller: _codeController,
                      textStyle: GoogleFonts.firaCode(
                        fontSize: 14,
                        height: 1.5,
                      ),
                      gutterStyle: GutterStyle(
                        background: backgroundColor,
                        textStyle: const TextStyle(color: Color(0xFF455A64)),
                        showLineNumbers: true,
                        margin: 12,
                      ),
                      background: backgroundColor,
                    ),
                  ),
                ),
              ),
            ),
            if (_showConsole) _buildConsolePanel(),
            _buildConsoleFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildConsolePanel() {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        color: Color(0xFF0E141E),
        border: Border(top: BorderSide(color: Colors.white24)),
      ),
      child: Column(
        children: [
          if (_testResults.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: const Color(0xFF1C2333),
              child: Row(
                spacing: 8,
                children: _testResults.asMap().entries.map((e) {
                  final passed = e.value['passed'] as bool;
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: passed
                          ? Colors.green.withValues(alpha: 0.15)
                          : Colors.red.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: passed ? Colors.green : Colors.red,
                      ),
                    ),
                    child: Text(
                      'Case ${e.key + 1}: ${passed ? '✓ Passed' : '✗ Failed'}',
                      style: TextStyle(
                        color: passed ? Colors.green : Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: _isRunning
                  ? const Center(
                      child: CircularProgressIndicator(color: Colors.white54),
                    )
                  : Text(
                      _consoleOutput.isEmpty ? 'No output' : _consoleOutput,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToolbar() {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: const Color(0xFF1C2333),
      child: Row(
        children: [
          const Icon(Icons.settings_outlined, color: Colors.white54, size: 18),
          const SizedBox(width: 10),
          DropdownButtonHideUnderline(
            child: DropdownButton<CodeTemplateEntity>(
              value: _selectedTemplate,
              dropdownColor: const Color(0xFF1C2333),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white54,
                size: 16,
              ),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              onChanged: (t) {
                if (t != null) _onLanguageChanged(t);
              },
              items: widget.templates.map((t) {
                return DropdownMenuItem<CodeTemplateEntity>(
                  value: t,
                  child: Text(t.languageName),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConsoleFooter() {
    return BlocBuilder<SubmitCodeCubit, SubmitCodeState>(
      builder: (context, state) {
        final isSaving = state is SubmitCodeLoading && !_isRunning;
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: const BoxDecoration(
            color: Color(0xFF0E141E),
            border: Border(top: BorderSide(color: Colors.white10)),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => setState(() => _showConsole = !_showConsole),
                child: Row(
                  children: [
                    Icon(
                      _showConsole
                          ? Icons.keyboard_arrow_down
                          : Icons.keyboard_arrow_up,
                      color: Colors.white54,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "Console",
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                spacing: 12,
                children: [
                  CustomButton(
                    onPressed: _isRunning ? null : _runCode,
                    text: _isRunning ? "" : "Run Code",
                    widthBtn: 170,
                    child: _isRunning
                        ? Center(
                            child: const SizedBox(
                              height: 18,
                              width: 18,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : null,
                  ),
                  CustomButton(
                    onPressed: isSaving
                        ? null
                        : () => _saveCode(isFinalSubmit: false),
                    text: isSaving ? "" : "Save Code",
                    widthBtn: 170,
                    child: isSaving
                        ? Center(
                            child: const SizedBox(
                              height: 18,
                              width: 18,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : null,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }
}
