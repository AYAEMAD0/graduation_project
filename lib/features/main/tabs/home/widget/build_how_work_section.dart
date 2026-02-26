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
            fontSize: isMobile ? 20 : 30,
            color: const Color(0xFF475569),
          ),
        ),
        SizedBox(height: isMobile ? 50 : 100),
        Column(
          children: [
            FeatureStepCard(
              stepNumber: "1",
              title: " Upload CV",
              description:
                  "Our AI scans your resume to\ntailor questions specifically to\nyour experience.",
              icon: AppAsset.upload,
              iconBackgroundColor: const Color(0xffDBEAFE),
            ),
            const SizedBox(height: 60),
            FeatureStepCard(
              stepNumber: "2",
              title: " Analyze Gap",
              description:
                  "Identify missing keywords and\nskills compared to the job\ndescription.",
              icon: AppAsset.analyze,
              iconBackgroundColor: const Color(0xffF3E8FF),
            ),
            const SizedBox(height: 60),
            FeatureStepCard(
              stepNumber: "3",
              title: "Live AI Interview",
              description:
                  "Interactive voice session with our\nAI avatar simulating a real HR\nmanager.",
              icon: AppAsset.live,
              iconBackgroundColor: const Color(0xffFCE7F3),
            ),
            const SizedBox(height: 60),
            FeatureStepCard(
              stepNumber: "4",
              title: "Instant Feedback",
              description:
                  "Get a detailed score, transcripts,\nand actionable advice to\nimprove.",
              icon: AppAsset.feedBack,
              iconBackgroundColor: const Color(0xffDCFCE7),
            ),
          ],
        ),
      ],
    );
  }
}
