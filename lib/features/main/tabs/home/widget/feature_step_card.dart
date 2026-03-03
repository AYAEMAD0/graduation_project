import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:responsive_framework/responsive_framework.dart';

class FeatureStepCard extends StatelessWidget {
  final String stepNumber;
  final String title;
  final String description;
  final String icon;
  final Color iconBackgroundColor;

  const FeatureStepCard({
    super.key,
    required this.stepNumber,
    required this.title,
    required this.description,
    required this.icon,
    required this.iconBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return Container(
      width: isMobile ? double.infinity : 700,
      padding: EdgeInsets.symmetric(
        vertical: 32,
        horizontal: isMobile ? 20 : 50,
      ),
      margin: isMobile
          ? const EdgeInsets.symmetric(horizontal: 16)
          : EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: isMobile ? 48 : 52,
            height: isMobile ? 48 : 52,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset(
              icon,
              width: isMobile ? 24 : 26,
              height: isMobile ? 24 : 26,
            ),
          ),
          const SizedBox(width: 24),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$stepNumber. $title",
                  style: GoogleFonts.inter(
                    fontSize: isMobile ? 22 : 30,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1E293B),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: GoogleFonts.inter(
                    fontSize: isMobile ? 16 : 20,
                    color: AppColor.darkGray,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
