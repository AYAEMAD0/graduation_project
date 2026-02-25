import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/constants/app_asset.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'widget/build_description_section.dart';
import 'widget/build_how_work_section.dart';
import 'widget/build_no_credit_card_section.dart';
import 'widget/build_tech_section.dart';
import 'widget/build_title_section.dart';
import 'widget/copyright_section.dart';
import 'widget/stats_section.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoints = ResponsiveBreakpoints.of(context);
    final isMobile = breakpoints.isMobile;
    return Scaffold(
      backgroundColor: AppColor.homeBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                        const BuildTitleSection(),
                        SizedBox(height: isMobile ? 40 : 80),
                        const BuildDescriptionSection(),
                        SizedBox(height: isMobile ? 40 : 80),
                        CustomButton(
                          widthBtn: isMobile ? 250 : 400,
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
                        SizedBox(height: isMobile ? 20 : 30),
                        const BuildNoCreditCardSection(),
                        SizedBox(height: isMobile ? 15 : 80),
                        Image.asset(
                          AppAsset.person,
                          width: 800,
                          height: isMobile ? 350 : 600,
                        ),
                        SizedBox(height: isMobile ? 10 : 80),
                        const BuildTechSection(),
                        SizedBox(height: isMobile ? 40 : 80),
                        const BuildHowWorkSection(),
                        SizedBox(height: isMobile ? 40 : 80),
                        const StatsSection(),
                        const CopyrightSection(),
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
