import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'build_stat_item.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: isMobile ? 10 : 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: BuildStatItem(
              value:"10k+",
              label:isMobile?"Interviews":"Interviews Conducted",
              color:AppColor.purple,
            ),
          ),
          if (isMobile) const SizedBox(height: 50),
          Flexible(
            child: BuildStatItem(
              value: "92%",
              label: "Success Rate",
              color: const Color(0xFF0EA5E9),
            ),
          ),
        ],
      ),
    );
  }
}