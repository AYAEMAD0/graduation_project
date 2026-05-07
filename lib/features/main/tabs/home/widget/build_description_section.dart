import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../../core/theme/app_style.dart';

class BuildDescriptionSection extends StatelessWidget {
  const BuildDescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoints = ResponsiveBreakpoints.of(context);
    final isMobile = breakpoints.isMobile;
    return  RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: AppStyle.font58RegularSlate.copyWith(
          fontSize: isMobile ? 18 : 28,
          height: 1.5,
          color: Colors.grey[700],
        ),
        children: [
          const TextSpan(
            text:
            "Practice with our lifelike AI interviewer ",
          ),
          TextSpan(
            text: "Get real-time feedback on your\n",
            style: TextStyle(
              fontWeight: isMobile
                  ? FontWeight.normal
                  : FontWeight.w500,
            ),
          ),
          const TextSpan(
            text: "answers, body language and tone",
          ),
        ],
      ),
    );
  }
}
