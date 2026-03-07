import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/constants/app_asset.dart';
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
  }) : savedCode = savedCode ?? {};
}


class QuestionSidebar extends StatelessWidget {
  final SessionArguments args;

  const QuestionSidebar({
    required this.args,
    super.key,
  });

  void _onTap(BuildContext context, int number) async {
    if (args.hasUnsavedAnswer) {
      final confirm = await CustomDialog.showConfirm(
        context: context,
        title: "Leave without saving?",
        message: "You selected an answer but didn't save it yet.",
      );
      if (confirm != true) return;
      args.onRevertAnswer();
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
        question.savedCode[langId] = code;
        question.savedLanguageId = langId;
      },
    };

    if (question.type == "Coding") {
      Navigator.pushNamed(context, AppRoutes.codeWorkspace, arguments: {
        ...baseArgs,
        'questionId': question.questionId,
        'questionTitle': question.questionTitle,
        'questionText': question.questionText,
        'testCases': question.testCases,
        'templates': question.templates,
      });
    } else {
      Navigator.pushNamed(context, AppRoutes.mcqWorkspace, arguments: {
        ...baseArgs,
        'questionId': question.questionId,
        'questionText': question.questionText,
        'options': question.options,
      });
    }
    args.onQuestionSelected(number);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: double.infinity,
      decoration: const BoxDecoration(color: Color(0xffF3F4F6)),
      child: Column(
        children: [
          Image.asset(AppAsset.logoAppImage, width: 60, height: 60),
          GestureDetector(
            onTap: () {
              Navigator.popUntil(
                  context, ModalRoute.withName(AppRoutes.questionOverview));
              args.onQuestionSelected(0);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.symmetric(vertical: 3),
              decoration: BoxDecoration(
                color: args.currentQuestion == 0
                    ? const Color(0xffD5CDDD)
                    : Colors.transparent,
              ),
              alignment: Alignment.center,
              child: Text(
                "All",
                style: AppStyle.font16BlackSemiBold.copyWith(
                  color: args.currentQuestion == 0
                      ? AppColor.primaryPurpleColor
                      : AppColor.grayMediumColor,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: args.totalQuestions,
              itemBuilder: (context, index) {
                final number = index + 1;
                final isActive = number == args.currentQuestion;
                return GestureDetector(
                  onTap: () => _onTap(context, number),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(vertical: 3),
                    height: 50,
                    decoration: BoxDecoration(
                      color: isActive
                          ? const Color(0xffD5CDDD)
                          : Colors.transparent,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "$number",
                      style: AppStyle.font16BlackSemiBold.copyWith(
                        color: isActive
                            ? AppColor.primaryPurpleColor
                            : AppColor.grayMediumColor,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}