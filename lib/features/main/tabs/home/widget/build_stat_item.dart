import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

class BuildStatItem extends StatelessWidget {
  const BuildStatItem({
    super.key,
    required this.value,
    required this.label,
    required this.color,
  });
  final String value;
  final String label;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveBreakpoints.of(context).isMobile;
    double valueFontSize = isMobile ? 30 : 60;
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 6,
      children: [
        Text(
          value,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w800,
            fontSize: valueFontSize,
            height: 1.1,
            letterSpacing: -2,
            color: color,
          ),
        ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: isMobile ? 18 : 25.49,
            height: 1.43,
            color: const Color(0xFF64748B),
          ),
        ),
      ],
    );
  }
}
