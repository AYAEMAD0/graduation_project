import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../core/theme/app_color.dart';
import '../../../core/theme/app_gradient.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key, required this.progress});
  final double progress;
  @override
  Widget build(BuildContext context) {
    final breakpoints = ResponsiveBreakpoints.of(context);
    final isMobile = breakpoints.isMobile;

    return LayoutBuilder(
      builder: (context, constraints) {
        return LinearPercentIndicator(
          width: constraints.maxWidth,
          lineHeight: isMobile ? 10 : 25,
          percent: progress,
          animation: false,
          backgroundColor: AppColor.whiteDarkColor,
          barRadius: const Radius.circular(12),
          linearGradient: AppGradient.primaryGradient,
        );
      },
    );
  }
}
