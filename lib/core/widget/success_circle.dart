import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../theme/app_color.dart';
import '../theme/app_gradient.dart';

class SuccessCircle extends StatelessWidget {
  const SuccessCircle({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoints = ResponsiveBreakpoints.of(context);
    final isMobile = breakpoints.isMobile;
    final circleSize = isMobile ? 120.0 : 150.0;
    final iconSize = isMobile ? 60.0 : 70.0;
    return  Container(
      width: circleSize,
      height: circleSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 2,
          color: AppColor.primaryPurpleColor,
        ),
        gradient: AppGradient.primaryGradient,
      ),
      child: Icon(
        Icons.check,
        color: AppColor.whiteColor,
        size: iconSize,
      ),
    );
  }
}
