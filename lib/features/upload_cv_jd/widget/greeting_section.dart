import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:responsive_framework/responsive_framework.dart';

class GreetingSection extends StatelessWidget {
  const GreetingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile?12:20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Good Morning, Alex",
            style: AppStyle.font16GrayRegular.copyWith(
              fontSize: isMobile ? 25 : 48,
            ),
          ),
          const SizedBox(height: 12),
          RichText(
            text: TextSpan(
              style: isMobile
                  ? AppStyle.font34BlackSemiBold
                  : AppStyle.font48BlackBold.copyWith(fontSize: 80),
              children: const [
                TextSpan(text: "Ready to ace your "),
                TextSpan(
                  text: "next\n",
                  style: TextStyle(color: Color(0xffA855F7)),
                ),
                TextSpan(
                  text: "interview?",
                  style: TextStyle(color: Color(0xff06B6D4)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
