import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../core/config/di.dart';
import '../../../../core/helper/shared_check_helper.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/widget/custom_button.dart';
import '../../viewmodel/onboarding_cubit.dart';
import 'widget/onboarding_section.dart';

class WebOnboardingView extends StatelessWidget {
  const WebOnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<OnboardingCubit>();
    final pages = cubit.pages;
    final breakpoints = ResponsiveBreakpoints.of(context);
    final isMobile = breakpoints.isMobile;

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? Theme.of(context).scaffoldBackgroundColor
          : null,
      body: Stack(
        children: [
          Positioned.fill(
            child: IgnorePointer(
              child: Stack(
                children: [
                  Positioned(
                    top: isMobile ? -80 : -60,
                    left: isMobile ? -120 : -300,
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                      child: Container(
                        width: isMobile ? 400 : 800,
                        height: isMobile ? 300 : 700,
                        decoration: BoxDecoration(
                          color: AppColor.homeEffectBlue.withValues(
                            alpha: isDark ? 0.12 : 0.15,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: -100,
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 300, sigmaY: 100),
                      child: Container(
                        width: isMobile ? 300 : 600,
                        height: isMobile ? 300 : 600,
                        decoration: BoxDecoration(
                          color: isDark
                              ? AppColor.homeEffectBlue.withValues(alpha: 0.08)
                              : const Color(0xffE2ECF1).withValues(alpha: 0.90),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: -150,
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 600, sigmaY: 400),
                      child: Container(
                        width: isMobile ? 300 : 1500,
                        height: isMobile ? 300 : 900,
                        decoration: BoxDecoration(
                          color: isDark
                              ? Colors.white.withValues(alpha: 0.02)
                              : AppColor.grayColor.withValues(alpha: 0.18),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: -150,
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                      child: Container(
                        width: isMobile ? 400 : 900,
                        height: isMobile ? 400 : 900,
                        decoration: BoxDecoration(
                          color: AppColor.purple.withValues(
                            alpha: isDark ? 0.10 : 0.16,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Center(
              child: Column(
                children: [
                  OnboardingSection(
                    title: pages[0].title,
                    image: pages[0].image,
                    description: pages[0].description,
                  ),
                  const SizedBox(height: 100),
                  OnboardingSection(
                    title: pages[2].title,
                    image: pages[2].image,
                    description: pages[2].description,
                  ),
                  const SizedBox(height: 100),
                  OnboardingSection(
                    title: pages[1].title,
                    image: pages[1].image,
                    description: pages[1].description,
                  ),
                  const SizedBox(height: 60),
                  CustomButton(
                    text: "NEXT",
                    widthBtn: 380,
                    borderRadius: 20,
                    styleText: AppStyle.font25WhiteBold.copyWith(fontSize: 20),
                    onPressed: () {
                      SharedCheckHelper.setValue(
                        SharedCheckHelper.keyIsOnBoarding,
                        true,
                      );
                      Navigator.pushReplacementNamed(context, AppRoutes.login);
                    },
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
