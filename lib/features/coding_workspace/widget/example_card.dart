import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';

class ExampleCard extends StatelessWidget {
  final String inputExample;
  final String explanation;

  const ExampleCard({
    super.key,
    required this.inputExample,
    required this.explanation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20, bottom: 20, right: 20),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "EXAMPLE",
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              height: 16 / 12,
              letterSpacing: 0,
              color: const Color(0xFF64748B),
            ),
          ),
          const SizedBox(height: 12),

          Text(
            inputExample,
            style: GoogleFonts.jetBrainsMono(
              fontWeight: FontWeight.w400,
                fontSize: 14,
              height: 20.57 / 12,
              letterSpacing: 0,
              color: AppColor.purple
            ),
          ),
          const SizedBox(height: 12),

          Text(
            explanation,
            style: const TextStyle(
              fontSize: 14,
              height: 1.6,
              color: Color(0xFF37474F),
            ),
          ),
        ],
      ),
    );
  }
}
