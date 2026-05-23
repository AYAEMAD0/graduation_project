import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../routes/app_routes.dart';
import '../theme/app_color.dart';

class SessionExpired extends StatelessWidget {
  const SessionExpired({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xff0F111A)
          : Theme.of(context).scaffoldBackgroundColor,
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
                          height: isMobile ? 500 : 700,
                          decoration: BoxDecoration(
                            color: AppColor.homeEffectBlue.withValues(
                              alpha: isDark ? 0.10 : 0.15,
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
                                ? const Color(
                                    0xff1E293B,
                                  ).withValues(alpha: 0.20)
                                : const Color(
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
                        imageFilter: ImageFilter.blur(sigmaX: 600, sigmaY: 400),
                        child: Container(
                          width: isMobile ? 300 : 1500,
                          height: isMobile ? 300 : 900,
                          decoration: BoxDecoration(
                            color: AppColor.grayColor.withValues(
                              alpha: isDark ? 0.05 : 0.18,
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
                        imageFilter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                        child: Container(
                          width: isMobile ? 400 : 900,
                          height: isMobile ? 400 : 900,
                          decoration: BoxDecoration(
                            color: AppColor.purple.withValues(
                              alpha: isDark ? 0.08 : 0.16,
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
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.timer_off_outlined,
                    size: 67,
                    color: isDark ? const Color(0xffA855F7) : AppColor.purple,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Session Expired",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Your session data was lost.\nPlease start a new session.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: isDark ? Colors.grey.shade400 : Colors.grey,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 24),
                  CustomButton(
                    text: "Go to Home",
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.home,
                        (route) => false,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
