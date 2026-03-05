import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/routes/app_routes.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../domain/entities/session/interview_session/interview_session_entity.dart';
import '../../widget/question_sidebar.dart';
import 'action_button.dart';

class QuestionItemCard extends StatelessWidget {
  final int index;
  final String title;
  final String type;
  final bool isModified;
  final bool isActive;
  final VoidCallback? onTap;
  final int totalQuestions;
  final int remainingSeconds;
  final List<SidebarQuestion> sidebarQuestions;
  final List<McqOptionEntity> options;
  final int sessionId;

  // coding only
  final int? questionId;
  final String? questionText;
  final List<TestCaseEntity>? testCases;
  final List<CodeTemplateEntity>? templates;
  final Map<int, int> selectedAnswers;
  final void Function(int q, int a) onAnswerSelected;

  const QuestionItemCard({
    required this.index,
    required this.title,
    required this.type,
    required this.isModified,
    required this.totalQuestions,
    required this.remainingSeconds,
    required this.sidebarQuestions,
    required this.options,
    required this.sessionId,
    required this.selectedAnswers,
    required this.onAnswerSelected,
    this.isActive = false,
    this.onTap,
    this.questionId,
    this.questionText,
    this.testCases,
    this.templates,
    super.key,
  });

  void _navigateToQuestion(BuildContext context) {
    final baseArgs = {
      'currentQuestion': index,
      'totalQuestions': totalQuestions,
      'remainingSeconds': remainingSeconds,
      'questions': sidebarQuestions,
      'selectedAnswers': selectedAnswers,
      'onAnswerSelected': onAnswerSelected,
      'sessionId': sessionId,
    };

    if (type == "Coding") {
      Navigator.pushNamed(
        context,
        AppRoutes.codeWorkspace,
        arguments: {
          ...baseArgs,
          'questionId': questionId ?? 0,
          'questionTitle': title,
          'questionText': questionText ?? '',
          'testCases': testCases ?? [],
          'templates': templates ?? [],
        },
      );
    } else {
      Navigator.pushNamed(
        context,
        AppRoutes.mcqWorkspace,
        arguments: {
          ...baseArgs,
          'questionText': title,
          'options': options,
          'initialSelectedAnswer': selectedAnswers[index],
        },
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isActive
              ? AppColor.primaryPurpleColor.withValues(alpha: 0.08)
              : Colors.white.withValues(alpha: 0.55),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isActive
                ? AppColor.primaryPurpleColor
                : const Color(0xFFBBA6E8).withValues(alpha: 0.6),
            width: isActive ? 1.8 : 1.2,
          ),
        ),
        child: isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "$index.",
                        style: AppStyle.font20BlackSemiBold.copyWith(
                          color: AppColor.primaryPurpleColor,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(title, style: AppStyle.font20BlackSemiBold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    type,
                    style: AppStyle.font16GrayMediumMedium.copyWith(
                      color: AppColor.primaryPurpleColor,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ActionButton(
                      isModified: isModified,
                      type: type,
                      onTap: () => _navigateToQuestion(context),
                    ),
                  ),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: Row(
                      children: [
                        Text(
                          "$index.",
                          style: AppStyle.font20BlackSemiBold.copyWith(
                            color: AppColor.primaryPurpleColor,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            title,
                            style: AppStyle.font20BlackSemiBold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Text(
                        type,
                        style: AppStyle.font16GrayMediumMedium.copyWith(
                          color: AppColor.primaryPurpleColor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ActionButton(
                        isModified: isModified,
                        type: type,
                        onTap: () => _navigateToQuestion(context),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
