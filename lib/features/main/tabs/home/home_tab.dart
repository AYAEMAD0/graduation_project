import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/constants/app_asset.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';
import 'package:mock_mate_ai/core/widget/main_background.dart';
import 'package:mock_mate_ai/features/main/tabs/home/widget/interview_options_dialog.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../core/widget/scroll_animate.dart';
import 'widget/build_description_section.dart';
import 'widget/build_how_work_section.dart';
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
          child: MainBackground(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 2000),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 20 : 30,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: isMobile ? 20 : 35),
                          ScrollAnimate(
                            delay: const Duration(milliseconds: 100),
                            direction: SlideDirection.up,
                            child: const BuildTitleSection(),
                          ),
                          SizedBox(height: isMobile ? 20 : 20),
                          ScrollAnimate(
                            delay: const Duration(milliseconds: 200),
                            direction: SlideDirection.left,
                            child: const BuildDescriptionSection(),
                          ),
                          SizedBox(height: isMobile ? 30 : 30),
                          ScrollAnimate(
                            delay: const Duration(milliseconds: 300),
                            direction: SlideDirection.right,
                            child: CustomButton(
                              height: isMobile ? 60 : 80,
                              widthBtn: isMobile ? 270 : 600,
                              child: Center(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.video_camera_back,
                                      color: Colors.white,
                                      size: isMobile ? 30 : 35,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      "Start Mock Interview",
                                      style: isMobile
                                          ? AppStyle.font18WhiteBold
                                          : AppStyle.font18WhiteBold.copyWith(
                                              fontSize: 33,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => const InterviewOptionsDialog(),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: isMobile ? 0 : 30),
                          ScrollAnimate(
                            delay: const Duration(milliseconds: 400),
                            direction: SlideDirection.up,
                            child: Image.asset(
                              AppAsset.person,
                              width: 900,
                              height: isMobile ? 320 : 600,
                            ),
                          ),
                          SizedBox(height: isMobile ? 0 : 40),
                        ],
                      ),
                    ),

                    ScrollAnimate(
                      direction: SlideDirection.left,
                      child: BuildTechSection(),
                    ),
                    SizedBox(height: isMobile ? 20 : 60),

                    ScrollAnimate(
                      direction: SlideDirection.right,
                      child: BuildHowWorkSection(),
                    ),
                    SizedBox(height: isMobile ? 40 : 80),
                    ScrollAnimate(
                      direction: SlideDirection.left,
                      child: StatsSection(),
                    ),
                    const CopyrightSection(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
