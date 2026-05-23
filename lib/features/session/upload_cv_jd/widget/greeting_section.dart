import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:responsive_framework/responsive_framework.dart';

class GreetingSection extends StatelessWidget {
  const GreetingSection({super.key,});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              style: (isMobile
                  ? AppStyle.font34BlackSemiBold
                  : AppStyle.font48BlackBold.copyWith(fontSize: 28)).copyWith(
                color: isDark ? Colors.white : Colors.black,
              ),
              children: const [
                TextSpan(text: "Ready to ace your "),
                TextSpan(
                  text: "next ",
                  style: TextStyle(color: Color(0xff06B6D4)),
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