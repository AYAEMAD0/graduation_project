import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../../core/constants/app_asset.dart';
import '../../../../../core/theme/app_style.dart';
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
          "Four simple steps to land your dream job.",
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: isMobile ? 22 : 30,
            color: const Color(0xFF475569),
          ),
        ),
        SizedBox(height: isMobile ? 40 : 60),
        Column(
          children: [
            FeatureStepCard(
              stepNumber: "1",
              title: " Upload CV",
              description:
                  "Our AI scans your resume to tailor questions specifically to your experience.",
              icon: AppAsset.upload,
              iconBackgroundColor: const Color(0xffDBEAFE),
            ),
            SizedBox(height: isMobile ? 20 : 60),
            FeatureStepCard(
              stepNumber: "2",
              title: " Analyze Gap",
              description:
                  "Identify missing keywords and skills compared to the job description.",
              icon: AppAsset.analyze,
              iconBackgroundColor: const Color(0xffF3E8FF),
            ),
            SizedBox(height: isMobile ? 20 : 60),
            FeatureStepCard(
              stepNumber: "3",
              title: "Live AI Interview",
              description:
                  "Interactive voice session with our AI avatar simulating a real HR manager.",
              icon: AppAsset.live,
              iconBackgroundColor: const Color(0xffFCE7F3),
            ),
            SizedBox(height: isMobile ? 20 : 60),
            FeatureStepCard(
              stepNumber: "4",
              title: "Instant Feedback",
              description:
                  "Get a detailed score, transcripts, and actionable advice to improve.",
              icon: AppAsset.feedBack,
              iconBackgroundColor: const Color(0xffDCFCE7),
            ),
          ],
        ),
      ],
    );
  }
}
