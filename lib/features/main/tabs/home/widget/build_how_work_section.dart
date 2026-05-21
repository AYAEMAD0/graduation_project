import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../../core/constants/app_asset.dart';
import '../../../../../core/theme/app_style.dart';
import '../../../../../core/widget/scroll_animate.dart';
import 'feature_step_card.dart';

class BuildHowWorkSection extends StatelessWidget {
  const BuildHowWorkSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoints = ResponsiveBreakpoints.of(context);
    final isMobile = breakpoints.isMobile;
    return Column(
      children: [
        Text(
          "How It Works?",
          style: AppStyle.font154ExtraBold.copyWith(
            fontSize: isMobile ? 36 : 60,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "From setup to feedback \n Four simple steps to land your dream job.",
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: isMobile ? 22 : 30,
            color: const Color(0xFF475569),
          ),
        ),
        SizedBox(height: isMobile ? 40 : 60),
        Column(
          children: [
            ScrollAnimate(
              direction: SlideDirection.left,
              delay: const Duration(milliseconds: 100),
              child: FeatureStepCard(
                stepNumber: "1",
                title: "Choose Interview Type",
                description:
                    "Pick the interview style that suits you — Standard questions, Ai-generated, or a Voice simulation.",
                icon: Icons.tune_rounded,
                iconBackgroundColor: const Color(0xffF3E8FF),
              ),
            ),
            SizedBox(height: isMobile ? 20 : 60),
            ScrollAnimate(
              direction: SlideDirection.right,
              delay: const Duration(milliseconds: 100),
              child: FeatureStepCard(
                stepNumber: "2",
                title: "Set Up Your Session",
                description:
                    "Upload your CV and job description, or simply choose your track if you're going with a Voice interview — we'll tailor everything for you.",
                icon: AppAsset.upload,
                iconBackgroundColor: const Color(0xffDBEAFE),
              ),
            ),
            SizedBox(height: isMobile ? 20 : 60),
            ScrollAnimate(
              direction: SlideDirection.left,
              delay: const Duration(milliseconds: 100),
              child: FeatureStepCard(
                stepNumber: "3",
                title: "Start & Answer",
                description:
                    "Go through your interview and answer at your own pace.",
                icon: AppAsset.live,
                iconBackgroundColor: const Color(0xffFCE7F3),
              ),
            ),
            SizedBox(height: isMobile ? 20 : 60),
            ScrollAnimate(
              direction: SlideDirection.right,
              delay: const Duration(milliseconds: 100),
              child: FeatureStepCard(
                stepNumber: "4",
                title: "Get Your Feedback",
                description:
                    "Get a detailed score with insights on every answer to help you improve.",
                icon: AppAsset.feedBack,
                iconBackgroundColor: const Color(0xffDCFCE7),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
