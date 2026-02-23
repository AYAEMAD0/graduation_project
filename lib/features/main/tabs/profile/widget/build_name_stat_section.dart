import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../../core/theme/app_style.dart';
import 'build_stat_profile.dart';

class BuildNameStatSection extends StatelessWidget {
  const BuildNameStatSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoints = ResponsiveBreakpoints.of(context);
    final isMobile = breakpoints.isMobile;
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          "Alex Chen",
          style: AppStyle.font24BlackBold.copyWith(
            fontSize: isMobile ? 24 : 60,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Frontend Engineer",
          style: AppStyle.font24BlackBold.copyWith(
            fontSize: isMobile ? 20 : 24,
            color: Color(0xFFA806F9),
          ),
        ),
        const SizedBox(height: 14),
        Divider(thickness: 1.5, color: Colors.black.withValues(alpha: .35)),
        const SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            BuildStatProfile(value: "1", label: "INTERVIEWS"),
            BuildStatProfile(value: "85%", label: "AVG SCORE"),
          ],
        ),
      ],
    );
  }
}
