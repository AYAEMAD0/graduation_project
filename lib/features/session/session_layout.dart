import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/features/session/model/session_arguments.dart';
import 'package:mock_mate_ai/features/session/widget/question_header.dart';
import 'package:mock_mate_ai/features/session/widget/question_sidebar.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SessionLayout extends StatelessWidget {
  final Widget body;
  final String time;
  final SessionArguments args;

  const SessionLayout({
    super.key,
    required this.body,
    required this.time,
    required this.args,
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
                      currentQuestion: args.currentQuestion,
                      totalQuestions: args.totalQuestions,
                    ),
                    Expanded(child: body),
                  ],
                )
              : Row(
                  children: [
                    QuestionSidebar(args: args),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.65),
                        ),
                        child: Column(
                          children: [
                            QuestionHeader(
                              time: time,
                              currentQuestion: args.currentQuestion,
                              totalQuestions: args.totalQuestions,
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