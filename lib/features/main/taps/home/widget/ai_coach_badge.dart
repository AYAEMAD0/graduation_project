import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';

class AiCoachBadge extends StatelessWidget {
  const AiCoachBadge({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
        color: AppColor.purple.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          color: AppColor.purple.withValues(alpha: 0.30),
          width: 3.22,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(radius: 6, backgroundColor: AppColor.purple),
          SizedBox(width: 10),
          Text(
            "AI COACH V2.0 LIVE",
            style: GoogleFonts.inter(
              color: AppColor.purple,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
