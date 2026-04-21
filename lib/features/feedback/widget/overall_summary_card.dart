import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/font_weight_helper.dart';

class OverallSummaryCard extends StatelessWidget {
  final String summary;
  final String score;

  const OverallSummaryCard({
    super.key,
    required this.summary,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -60,
          right: -60,
          child: Container(
            width: 265.125,
            height: 265.125,
            decoration: BoxDecoration(
              color: const Color(0x33A806F9),
              borderRadius: BorderRadius.circular(13807.21),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 110.46, sigmaY: 110.46),
              child: Container(color: Colors.transparent),
            ),
          ),
        ),
        Container(
          width: 1369.81,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: const Color(0x0DA806F9),
            borderRadius: BorderRadius.circular(16.57),
            border: Border.all(color: const Color(0x33A806F9), width: 1.38),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.analytics_outlined,
                          size: 30.33,
                          color: Color(0xffA806F9),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Overall Summary",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                            height: 1.33,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      summary,
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        letterSpacing: 0,
                        fontWeight: FontWeightHelper.regular,
                        color: AppColor.blackColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              Container(
                width: 130,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0x1AA806F9),
                  borderRadius: BorderRadius.circular(16.57),
                  border: Border.all(
                    color: const Color(0x33A806F9),
                    width: 1.38,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: score,
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w900,
                              fontSize: 52,
                              color: const Color(0xffA806F9),
                            ),
                          ),
                          TextSpan(
                            text: "%",
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w900,
                              fontSize: 32,
                              color: const Color(0xffA806F9),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "OVERALL SCORE",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w700,
                        fontSize: 9,
                        letterSpacing: 1.66,
                        color: const Color(0xB2A806F9),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
