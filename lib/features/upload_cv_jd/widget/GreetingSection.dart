import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:responsive_framework/responsive_framework.dart';

class GreetingSection extends StatelessWidget {
  const GreetingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).isDesktop;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Good Morning, Alex", style: AppStyle.font16GrayRegular),
        const SizedBox(height: 12),
        RichText(
          text: TextSpan(
            style: isDesktop
                ? AppStyle.font48BlackBold
                : AppStyle.font36BlackBold,
            children: const [
              TextSpan(text: "Ready to ace your "),
              TextSpan(
                text: "next\n",
                style: TextStyle(color: Color(0xff6E7CF6)),
              ),
              TextSpan(
                text: "interview?",
                style: TextStyle(color: Color(0xff2CA7C9)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
