import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../../core/theme/app_color.dart';

class BuildProfileBackgroundEffect extends StatelessWidget {
  const BuildProfileBackgroundEffect({super.key});

  static List<Widget> items(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return [
      Positioned(
        top: isMobile ? -100 : -150,
        left: isMobile ? -80 : -100,
        child: ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
          child: Container(
            width: isMobile ? 300 : 700,
            height: isMobile ? 300 : 600,
            decoration: BoxDecoration(
              color: AppColor.homeEffectBlue.withValues(
                alpha: isDark ? 0.15 : 0.05,
              ),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),

      Positioned(
        top: isMobile ? 300 : 220,
        right: isMobile ? -100 : -150,
        child: ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
          child: Container(
            width: isMobile ? 300 : 800,
            height: isMobile ? 300 : 800,
            decoration: BoxDecoration(
              color: AppColor.purple.withValues(alpha: isDark ? 0.18 : 0.04),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}
