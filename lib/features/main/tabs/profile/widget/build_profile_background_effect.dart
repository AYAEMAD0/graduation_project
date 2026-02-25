import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../../core/theme/app_color.dart';

class BuildProfileBackgroundEffect extends StatelessWidget {
  const BuildProfileBackgroundEffect({super.key});

  static List<Widget> items(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return [
      Positioned(
        top: -150, left: -100,
        child: ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
          child: Container(
            width: isMobile ? 350 : 700,
            height: isMobile ? 350 : 600,
            decoration: BoxDecoration(
              color: AppColor.homeEffectBlue.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
      Positioned(
        top: 220, right: -150,
        child: ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
          child: Container(
            width: isMobile ? 350 : 800,
            height: isMobile ? 350 : 800,
            decoration: BoxDecoration(
              color: AppColor.purple.withValues(alpha: 0.2),
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