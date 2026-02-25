import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../../core/constants/app_asset.dart';
import '../../../../../core/theme/app_color.dart';

class BuildTechSection extends StatelessWidget {
  const BuildTechSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoints = ResponsiveBreakpoints.of(context);
    final isMobile = breakpoints.isMobile;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColor.whiteColor.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 20,
        runSpacing: 20,
        children: [
          SvgPicture.asset(
            AppAsset.lan_1,
            height: isMobile ? 40 : 70,
          ),
          SvgPicture.asset(
            AppAsset.python,
            height: isMobile ? 40 : 70,
          ),
          SvgPicture.asset(
            AppAsset.dart,
            height: isMobile ? 40 : 70,
          ),
          SvgPicture.asset(
            AppAsset.google,
            height: isMobile ? 40 : 70,
          ),
        ],
      ),
    );
  }
}
