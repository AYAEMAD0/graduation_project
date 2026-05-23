import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../../../core/config/di.dart';
import '../../../../../../core/theme/app_color.dart';
import '../viewmodel/signup_cubit.dart';
import '../widget/build_body_signup_section.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocProvider(
      create: (_) => getIt<SignupCubit>(),
      child: Scaffold(
        backgroundColor: isDark ? Theme.of(context).scaffoldBackgroundColor : null,
        body: SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              Positioned.fill(
                child: IgnorePointer(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: isMobile ? -80 : -60,
                        left: isMobile ? -120 : -300,
                        child: ImageFiltered(
                          imageFilter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                          child: Container(
                            width: isMobile ? 400 : 800,
                            height: isMobile ? 550 : 700,
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
              BuildBodySignupSection()
            ],
          ),
        ),
      ),
    );
  }
}