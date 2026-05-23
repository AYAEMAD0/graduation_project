import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';

class MainBackground extends StatelessWidget {
  final Widget child;

  const MainBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(
          child: IgnorePointer(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: isMobile ? -80 : -10,
                  left: isMobile ? -120 : -300,
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 100, sigmaY: 10),
                    child: Container(
                      width: isMobile ? 400 : 800,
                      height: isMobile ? 500 : 700,
                      decoration: BoxDecoration(
                        color: isDark
                            ? AppColor.homeEffectBlue.withValues(alpha: 0.08)
                            : AppColor.homeEffectBlue.withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  bottom: -480,
                  left: -100,
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 300, sigmaY: 100),
                    child: Container(
                      width: isMobile ? 300 : 600,
                      height: isMobile ? 300 : 600,
                      decoration: BoxDecoration(
                        color: isDark
                            ? const Color(0xff1E293B).withValues(alpha: 0.40)
                            : const Color(0xffE2ECF1).withValues(alpha: 0.90),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 300,
                  right: -150,
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 600, sigmaY: 200),
                    child: Container(
                      width: isMobile ? 300 : 1500,
                      height: isMobile ? 300 : 900,
                      decoration: BoxDecoration(
                        color: isDark
                            ? Colors.black.withValues(alpha: 0.2)
                            : AppColor.grayColor.withValues(alpha: 0.16),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 0,
                  right: -300,
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 300, sigmaY: 100),
                    child: Container(
                      width: isMobile ? 400 : 900,
                      height: isMobile ? 400 : 900,
                      decoration: BoxDecoration(
                        color: isDark
                            ? AppColor.purple.withValues(alpha: 0.10)
                            : AppColor.purple.withValues(alpha: 0.18),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SafeArea(child: child),
      ],
    );
  }
}