import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../core/config/di.dart';
import '../../viewmodel/onboarding_cubit.dart';
import 'widget/build_body_section.dart';
import 'widget/build_button_section.dart';
import 'widget/build_dots_section.dart';

class MobileOnboardingView extends StatelessWidget {
  MobileOnboardingView({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    final breakpoints = ResponsiveBreakpoints.of(context);
    final isMobile = breakpoints.isMobile;
    final cubit = getIt<OnboardingCubit>();
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<OnboardingCubit, int>(
        builder: (context, currentPage) {
          final pages = cubit.pagesMobile;
          return SafeArea(
            child: Scaffold(
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
                              imageFilter: ImageFilter.blur(
                                sigmaX: 100,
                                sigmaY: 100,
                              ),
                              child: Container(
                                width: isMobile ? 400 : 800,
                                height: isMobile ? 300 : 700,
                                decoration: BoxDecoration(
                                  color: AppColor.homeEffectBlue.withValues(
                                    alpha: 0.15,
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
                              imageFilter: ImageFilter.blur(
                                sigmaX: 300,
                                sigmaY: 100,
                              ),
                              child: Container(
                                width: isMobile ? 300 : 600,
                                height: isMobile ? 300 : 600,
                                decoration: BoxDecoration(
                                  color: Color(
                                    0xffE2ECF1,
                                  ).withValues(alpha: 0.90),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: -150,
                            child: ImageFiltered(
                              imageFilter: ImageFilter.blur(
                                sigmaX: 600,
                                sigmaY: 400,
                              ),
                              child: Container(
                                width: isMobile ? 300 : 1500,
                                height: isMobile ? 300 : 900,
                                decoration: BoxDecoration(
                                  color: AppColor.grayColor.withValues(
                                    alpha: 0.18,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: -150,
                            child: ImageFiltered(
                              imageFilter: ImageFilter.blur(
                                sigmaX: 100,
                                sigmaY: 100,
                              ),
                              child: Container(
                                width: isMobile ? 400 : 900,
                                height: isMobile ? 400 : 900,
                                decoration: BoxDecoration(
                                  color: AppColor.purple.withValues(
                                    alpha: 0.16,
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                    child: Column(
                      children: [
                        // PageView
                        Expanded(
                          child: PageView.builder(
                            controller: _controller,
                            itemCount: pages.length,
                            onPageChanged: (index) => cubit.setPage(index),
                            itemBuilder: (context, index) {
                              final page = pages[index];
                              return BuildBodySection(page: page);
                            },
                          ),
                        ),
                        SizedBox(height: 15),
                        // Dots
                        BuildDotsSection(
                          currentPage: currentPage,
                          controller: _controller,
                          cubit: cubit,
                          length: pages.length,
                        ),
                        SizedBox(height: 50),
                        // Buttons
                        BuildButtonSection(
                          currentPage: currentPage,
                          controller: _controller,
                          cubit: cubit,
                          length: pages.length,
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
