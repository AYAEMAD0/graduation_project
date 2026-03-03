import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/features/question_overview_list/presentation/widget/question_content.dart';
import 'package:mock_mate_ai/features/question_overview_list/presentation/widget/question_header.dart';
import 'package:mock_mate_ai/features/question_overview_list/presentation/widget/question_sidebar.dart';
import 'package:responsive_framework/responsive_framework.dart';

class QuestionOverviewScreen extends StatelessWidget {
  const QuestionOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveBreakpoints.of(context).isMobile;
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
                  children: const [
                    QuestionHeader(
                      time: "24:52",
                      currentQuestion: 2,
                      totalQuestions: 5,
                    ),
                    Expanded(child: QuestionContent()),
                  ],
                )
              : Row(
                  children: [
                    const QuestionSidebar(currentIndex: 1, totalQuestions: 10),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.65),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            QuestionHeader(
                              time: "24:52",
                              currentQuestion: 2,
                              totalQuestions: 5,
                            ),
                            Expanded(child: QuestionContent()),
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
