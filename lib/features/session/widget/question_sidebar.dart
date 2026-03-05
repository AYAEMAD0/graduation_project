import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/constants/app_asset.dart';
import 'package:mock_mate_ai/core/routes/app_routes.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';

import '../../../domain/entities/session/interview_session/interview_session_entity.dart';

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
  final int currentIndex;
  final int totalQuestions;
  final int remainingSeconds;
  final List<SidebarQuestion> questions;
  final void Function(int index) onQuestionSelected;
  final Map<int, int> selectedAnswers;
  final void Function(int q, int a) onAnswerSelected;
  final int sessionId;

  const QuestionSidebar({
    required this.currentIndex,
    required this.totalQuestions,
    required this.remainingSeconds,
    required this.questions,
    required this.onQuestionSelected,
    required this.selectedAnswers,
    required this.onAnswerSelected,
    required this.sessionId,
    super.key,
  });

  void _onTap(BuildContext context, int number) {
    final question = questions.firstWhere(
          (q) => q.index == number,
      orElse: () => SidebarQuestion(index: number, type: "Coding"),
    );

    final baseArgs = {
      'currentQuestion': number,
      'totalQuestions': totalQuestions,
      'remainingSeconds': remainingSeconds,
      'questions': questions,
      'selectedAnswers': selectedAnswers,
      'onAnswerSelected': onAnswerSelected,
      'sessionId': sessionId,
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
        'questionText': question.questionText,
        'options': question.options,
        'initialSelectedAnswer': selectedAnswers[number],
      });
    }
    onQuestionSelected(number);
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
              onQuestionSelected(0);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.symmetric(vertical: 3),
              decoration: BoxDecoration(
                color: currentIndex == 0 ? const Color(0xffD5CDDD) : Colors
                    .transparent,
              ),
              alignment: Alignment.center,
              child: Text("All",
                  style: AppStyle.font16BlackSemiBold.copyWith(
                    color: currentIndex == 0
                        ? AppColor.primaryPurpleColor
                        : AppColor.grayMediumColor,
                  )),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: totalQuestions,
              itemBuilder: (context, index) {
                final number = index + 1;
                final isActive = number == currentIndex;
                return GestureDetector(
                  onTap: () => _onTap(context, number),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(vertical: 3),
                    height: 50,
                    decoration: BoxDecoration(
                      color: isActive ? const Color(0xffD5CDDD) : Colors
                          .transparent,
                    ),
                    alignment: Alignment.center,
                    child: Text("$number",
                        style: AppStyle.font16BlackSemiBold.copyWith(
                          color: isActive
                              ? AppColor.primaryPurpleColor
                              : AppColor.grayMediumColor,
                        )),
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