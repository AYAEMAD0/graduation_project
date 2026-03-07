import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/features/session/widget/question_header.dart';
import 'package:mock_mate_ai/features/session/widget/question_sidebar.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SessionLayout extends StatelessWidget {
  final Widget body;
  final String time;
  final int currentQuestion;
  final int totalQuestions;
  final int remainingSeconds;
  final List<SidebarQuestion> questions;
  final void Function(int index) onQuestionSelected;
  final Map<int, int> selectedAnswers;
  final void Function(int q, int a) onAnswerSelected;
  final int sessionId;
  final Set<int> savedQuestions;
  final void Function(int) onQuestionSaved;
  final bool hasUnsavedAnswer;
  final void Function() onRevertAnswer;
  final void Function(int, int?) onRevertAnswerRaw;
  final Map<int, int> savedAnswers;

  const SessionLayout({
    super.key,
    required this.body,
    required this.time,
    required this.currentQuestion,
    required this.totalQuestions,
    required this.remainingSeconds,
    required this.questions,
    required this.onQuestionSelected,
    required this.selectedAnswers,
    required this.onAnswerSelected,
    required this.sessionId,
    required this.savedQuestions,
    required this.onQuestionSaved,
    required this.hasUnsavedAnswer,
    required this.onRevertAnswer,
    required this.onRevertAnswerRaw,
    required this.savedAnswers,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Scaffold(
      backgroundColor: AppColor.homeBackground,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -150,
            left: -100,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
              child: Container(
                width: 700,
                height: 600,
                decoration: BoxDecoration(
                  color: AppColor.homeEffectBlue.withValues(alpha: 0.70),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            right: -150,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
              child: Container(
                width: 700,
                height: 600,
                decoration: BoxDecoration(
                  color: AppColor.purple.withValues(alpha: 0.70),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          isMobile
              ? Column(
                  children: [
                    QuestionHeader(
                      time: time,
                      currentQuestion: currentQuestion,
                      totalQuestions: totalQuestions,
                    ),
                    Expanded(child: body),
                  ],
                )
              : Row(
                  children: [
                    QuestionSidebar(
                      currentIndex: currentQuestion,
                      totalQuestions: totalQuestions,
                      remainingSeconds: remainingSeconds,
                      questions: questions,
                      onQuestionSelected: onQuestionSelected,
                      selectedAnswers: selectedAnswers,
                      onAnswerSelected: onAnswerSelected,
                      sessionId: sessionId,
                      savedQuestions: savedQuestions,
                      onQuestionSaved: onQuestionSaved,
                      hasUnsavedAnswer: hasUnsavedAnswer,
                      onRevertAnswer: onRevertAnswer,
                      onRevertAnswerRaw: onRevertAnswerRaw,
                      savedAnswers: savedAnswers,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.65),
                        ),
                        child: Column(
                          children: [
                            QuestionHeader(
                              time: time,
                              currentQuestion: currentQuestion,
                              totalQuestions: totalQuestions,
                            ),
                            Expanded(child: body),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
