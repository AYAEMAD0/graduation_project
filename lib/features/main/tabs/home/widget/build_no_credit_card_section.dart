import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../../core/constants/app_asset.dart';

class BuildNoCreditCardSection extends StatelessWidget {
  const BuildNoCreditCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoints = ResponsiveBreakpoints.of(context);
    final isMobile = breakpoints.isMobile;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppAsset.trueIcn,
          width: 24,
          height: 24,
        ),
        const SizedBox(width: 8),
        Text(
          "No credit card required",
          style: GoogleFonts.inter(
            fontSize: isMobile ? 16 : 24,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF64748B),
          ),
        ),
      ],
    );
  }
}
