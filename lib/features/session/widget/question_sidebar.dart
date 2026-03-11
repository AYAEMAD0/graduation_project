import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/routes/app_routes.dart';
import 'package:mock_mate_ai/features/session/widget/build_sidebar.dart';

import '../../../core/widget/custom_dialog.dart';
import '../../../domain/entities/session/interview_session/interview_session_entity.dart';
import '../model/session_arguments.dart';

class SidebarQuestion {
  final int index;
  final String type;
  final String questionTitle;
  final String questionText;
  final List<McqOptionEntity> options;
  final List<TestCaseEntity> testCases;
  final List<CodeTemplateEntity> templates;
  final int questionId;
  Map<int, String> savedCode;
  int? savedLanguageId;
  Map<int, String> tempCode;
  int? tempLanguageId;

  SidebarQuestion({
    required this.index,
    required this.type,
    this.questionTitle = '',
    this.questionText = '',
    this.options = const [],
    this.testCases = const [],
    this.templates = const [],
    this.questionId = 0,
    Map<int, String>? savedCode,
    this.savedLanguageId,
  })
      : savedCode = savedCode ?? {},
        tempCode = {};

  bool get hasUnsavedChanges => tempCode.isNotEmpty;
}

class QuestionSidebar extends StatelessWidget {
  final SessionArguments args;

  const QuestionSidebar({required this.args, super.key});

  Future<bool> _confirmLeave(BuildContext context) async {
    final confirm = await CustomDialog.showConfirm(
      context: context,
      title: "Leave without saving?",
      message: "Your changes won't be saved if you leave.",
    );
    return confirm == true;
  }

  bool _hasUnsaved(SidebarQuestion current) {
    if (current.type == "Coding") return current.hasUnsavedChanges;
    return args.hasUnsavedAnswer;
  }

  void _clearUnsaved(SidebarQuestion current) {
    if (current.type == "Coding") {
      current.tempCode.clear();
      current.tempLanguageId = null;
    } else {
      args.onRevertAnswer(
        current.questionId,
        args.savedAnswers[current.questionId],
      );
    }
  }

  SidebarQuestion _currentQuestion() {
    return args.questions.firstWhere(
          (q) => q.index == args.currentQuestion,
      orElse: () => SidebarQuestion(index: args.currentQuestion, type: ''),
    );
  }

  void _onAllTap(BuildContext context) async {
    final current = _currentQuestion();

    if (_hasUnsaved(current)) {
      final confirmed = await _confirmLeave(context);
      if (!context.mounted) return;
      if (!confirmed) return;
      _clearUnsaved(current);
    }
    args.onQuestionSelected(0);

    Navigator.popUntil(
      context,
      ModalRoute.withName(AppRoutes.questionOverview),
    );
  }

  void _onTap(BuildContext context, int number) async {
    final current = _currentQuestion();

    if (_hasUnsaved(current)) {
      final confirmed = await _confirmLeave(context);
      if (!confirmed) return;
      _clearUnsaved(current);
    }

    final question = args.questions.firstWhere(
          (q) => q.index == number,
      orElse: () => SidebarQuestion(index: number, type: "Coding"),
    );

    final sessionArgs = args.copyWith(currentQuestion: number);

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
    args.onQuestionSelected(number);
    final fromOverview = args.currentQuestion == 0;

    if (!context.mounted) return;
    if (question.type == "Coding") {
      fromOverview
          ? Navigator.pushNamed(
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
      )
          : Navigator.pushReplacementNamed(
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
      fromOverview
          ? Navigator.pushNamed(
        context,
        AppRoutes.mcqWorkspace,
        arguments: {
          ...baseArgs,
          'questionId': question.questionId,
          'questionText': question.questionText,
          'options': question.options,
        },
      )
          : Navigator.pushReplacementNamed(
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
    return BuildSidebar(
      args: args,
      onTap: _onTap,
      onAllTap: _onAllTap,
    );
  }
}