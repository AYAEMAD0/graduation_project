import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../../core/theme/app_color.dart';

class BuildTitleSection extends StatelessWidget {
  const BuildTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoints = ResponsiveBreakpoints.of(context);
    final isMobile = breakpoints.isMobile;
    double fontSize=isMobile?48:120;

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: AppStyle.font154ExtraBold.copyWith(
          fontSize: fontSize,
          height: 1.1,
        ),
        children: [
          const TextSpan(text: "Master Your\n"),
          const TextSpan(text: "Next "),
          const TextSpan(text: "Interview with "),
          TextSpan(
            text: "AI",
            style: AppStyle.font154ExtraBold.copyWith(
              fontSize: fontSize,
              color: AppColor.purple,
              height: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}
