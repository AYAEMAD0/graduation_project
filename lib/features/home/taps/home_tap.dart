import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/features/home/widget/ai_coach_badge.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoints = ResponsiveBreakpoints.of(context);

    final isMobile = breakpoints.isMobile;
    final isTablet = breakpoints.isTablet;
    // ignore: unused_local_variable
    final isDesktop = breakpoints.isDesktop;

    double fontSize;

    if (isMobile) {
      fontSize = 48;
    } else if (isTablet) {
      fontSize = 80;
    } else {
      fontSize = 140;
    }

    return Scaffold(
      backgroundColor: AppColor.homeBackground,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xffCDE7EE), 
                  Color(0xffE6D8F5), 
                ],
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 20 : 40,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: isMobile ? 40 : 70),

                        const AiCoachBadge(),

                        const SizedBox(height: 20),

                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: AppStyle.font154InterExtraBold.copyWith(
                              fontSize: fontSize,
                              height: 1.1,
                            ),
                            children: [
                              const TextSpan(text: "Master Your\n"),
                              const TextSpan(text: "Next\n"),
                              const TextSpan(text: "Interview with\n"),
                              TextSpan(
                                text: "AI",
                                style: AppStyle.font154InterExtraBold.copyWith(
                                  fontSize: fontSize,
                                  color: AppColor.purple,
                                  height: 1.1,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: isMobile ? 40 : 80),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
