import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mock_mate_ai/core/constants/app_asset.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';
import 'package:mock_mate_ai/features/main/taps/home/widget/copyright_section.dart';
import 'package:mock_mate_ai/features/main/taps/home/widget/feature_step_card.dart';
import 'package:mock_mate_ai/features/main/taps/home/widget/stats_section.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/features/main/taps/home/widget/ai_coach_badge.dart';

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
      fontSize = 120;
    }

    return Scaffold(
      backgroundColor: AppColor.homeBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -150,
                left: -100,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                  child: Container(
                    width: 500,
                    height: 500,
                    decoration: BoxDecoration(
                      color: AppColor.homeEffectBlue.withValues(alpha: 0.15),
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
                    width: 600,
                    height: 600,
                    decoration: BoxDecoration(
                      color: AppColor.purple.withValues(alpha: 0.12),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),

              Center(
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
                              const TextSpan(text: "Next "),
                              const TextSpan(text: "Interview with "),
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
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: AppStyle.font58InterRegularSlate.copyWith(
                              fontSize: isMobile ? 18 : 24,
                              height: 1.5,
                              color: Colors.grey[700],
                            ),
                            children: [
                              const TextSpan(
                                text:
                                    "Practice with our lifelike AI interviewer\n",
                              ),
                              TextSpan(
                                text: "Get real-time feedback on your\n",
                                style: TextStyle(
                                  fontWeight: isMobile
                                      ? FontWeight.normal
                                      : FontWeight.w500,
                                ),
                              ),
                              const TextSpan(
                                text: "answers, body language and tone",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: isMobile ? 40 : 80),
                        CustomButton(
                          widthBtn: isMobile ? 220 : 350,
                          radius: 20,
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.video_camera_back,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "Start Mock Interview",
                                  style: AppStyle.font18WhiteBold,
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {},
                        ),
                        SizedBox(height: isMobile ? 40 : 80),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppAsset.trueIcn,
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "No credit card required",
                              style: GoogleFonts.inter(
                                fontSize: 24.03,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF64748B),
                                height: 64.3 / 45.03,
                                letterSpacing: 0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: isMobile ? 40 : 80),
                        Image.asset(AppAsset.person, width: 800, height: 600),
                        SizedBox(height: isMobile ? 40 : 80),
                        Container(
                          padding: const EdgeInsets.all(24),
                          color: AppColor.whiteColor,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(AppAsset.lan_1, height: 70),
                              const SizedBox(width: 16),
                              SvgPicture.asset(AppAsset.python, height: 70),
                              const SizedBox(width: 16),
                              SvgPicture.asset(AppAsset.dart, height: 70),
                              const SizedBox(width: 16),
                              SvgPicture.asset(AppAsset.google, height: 70),
                            ],
                          ),
                        ),
                        SizedBox(height: isMobile ? 40 : 80),
                        Text(
                          "How It Works?",
                          style: AppStyle.font154InterExtraBold.copyWith(
                            fontSize: isMobile ? 36 : 60,
                          ),
                        ),
                        SizedBox(height: isMobile ? 40 : 30),
                        Text(
                          "Four simple steps to land your dream job.",
                          style: GoogleFonts.inter(
                            fontSize: 30.13,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF475569),
                            height: 67.7 / 45.13,
                            letterSpacing: 0,
                          ),
                        ),

                        const SizedBox(height: 100),

                        Column(
                          spacing: 60,
                          children: [
                            FeatureStepCard(
                              stepNumber: "1",
                              title: " Upload CV",
                              description:
                                  "Our AI scans your resume to\ntailor questions specifically to\nyour experience.",
                              icon: AppAsset.upload,
                              iconBackgroundColor: Color(0xffDBEAFE),
                            ),

                            FeatureStepCard(
                              stepNumber: "2",
                              title: " Analyze Gap",
                              description:
                                  "Identify missing keywords and\nskills compared to the job\ndescription.",
                              icon: AppAsset.analyze,
                              iconBackgroundColor: Color(0xffF3E8FF),
                            ),
                            FeatureStepCard(
                              stepNumber: "3",
                              title: "Live AI Interview",
                              description:
                                  "Interactive voice session with our\nAI avatar simulating a real HR\nmanager.",
                              icon: AppAsset.live,
                              iconBackgroundColor: Color(0xffFCE7F3),
                            ),
                            FeatureStepCard(
                              stepNumber: "4",
                              title: "Instant Feedback",
                              description:
                                  "Get a detailed score, transcripts,\nand actionable advice to\nimprove.",
                              icon: AppAsset.feedBack,
                              iconBackgroundColor: Color(0xffDCFCE7),
                            ),
                          ],
                        ),
                        StatsSection(),
                        CopyrightSection(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
