import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../domain/entities/session/interview_session/interview_session_entity.dart';
import 'code_toolbar.dart';
import 'console_footer.dart';
import 'console_panel.dart';

class BuildBodyCode extends StatelessWidget {
  const BuildBodyCode({
    super.key,
    required this.template,
    required this.onLanguageChanged,
    required this.codeController,
    required this.onRunCode,
    required this.onSaveCode,
    required this.onToggleConsole,
    required this.showConsole,
    required this.templates,
    required this.questionId,
    required this.savedCodeQuestions,
  });

  final CodeTemplateEntity template;
  final void Function(CodeTemplateEntity) onLanguageChanged;
  final CodeController codeController;
  final void Function() onRunCode;
  final void Function() onSaveCode;
  final void Function() onToggleConsole;
  final bool showConsole;
  final List<CodeTemplateEntity> templates;
  final int questionId;
  final Set<int> savedCodeQuestions;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF0E141E),
      child: Column(
        children: [
          CodeToolbar(
            templates: templates,
            selectedTemplate: template,
            onChanged: onLanguageChanged,
          ),
          Expanded(
            child: CodeTheme(
              data: CodeThemeData(styles: monokaiSublimeTheme),
              child: SingleChildScrollView(
                child: CodeField(
                  controller: codeController,
                  textStyle: GoogleFonts.firaCode(fontSize: 14, height: 1.5),
                  gutterStyle: GutterStyle(
                    background: Color(0xFF0E141E),
                    textStyle: const TextStyle(color: Color(0xFF455A64)),
                    showLineNumbers: true,
                    margin: 12,
                  ),
                  background: Color(0xFF0E141E),
                ),
              ),
            ),
          ),
          if (showConsole) ConsolePanel(),
          ConsoleFooter(
            showConsole: showConsole,
            onToggleConsole: onToggleConsole,
            onRunCode: onRunCode,
            onSaveCode: onSaveCode,
            isAlreadySaved: savedCodeQuestions.contains(questionId),
          ),
        ],
      ),
    );
  }
}
