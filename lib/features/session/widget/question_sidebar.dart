import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/routes/app_routes.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';

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
  }) : savedCode = savedCode ?? {},
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final currentActive = args.currentQuestion;

    return Container(
      width: 90,
      height: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xff111522) : Colors.grey.shade50,
        border: Border(
          right: BorderSide(
            color: isDark
                ? Colors.white.withValues(alpha: 0.06)
                : Colors.grey.shade200,
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 24),
          _buildItem(
            context: context,
            label: "All",
            isSelected: currentActive == 0,
            isDark: isDark,
            onTap: () => _onAllTap(context),
          ),
          const SizedBox(height: 16),
          Divider(
            color: isDark
                ? Colors.white.withValues(alpha: 0.06)
                : Colors.grey.shade200,
            indent: 16,
            endIndent: 16,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemCount: args.totalQuestions,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemBuilder: (context, index) {
                final questionNumber = index + 1;
                final isSelected = currentActive == questionNumber;

                return _buildItem(
                  context: context,
                  label: "$questionNumber",
                  isSelected: isSelected,
                  isDark: isDark,
                  onTap: () => _onTap(context, questionNumber),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem({
    required BuildContext context,
    required String label,
    required bool isSelected,
    required bool isDark,
    required VoidCallback onTap,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            color: isSelected
                ? AppColor.primaryPurpleColor
                : (isDark ? const Color(0xff1E2332) : Colors.grey.shade200),
            shape: BoxShape.circle,
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: AppColor.primaryPurpleColor.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Center(
            child: Text(
              label,
              style: AppStyle.font16BlackMedium.copyWith(
                color: isSelected
                    ? Colors.white
                    : (isDark ? Colors.grey.shade400 : Colors.black87),
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,              ),
            ),
          ),
        ),
      ),
    );
  }
}
