import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mock_mate_ai/core/constants/app_asset.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'build_footer_link.dart';

class CopyrightSection extends StatelessWidget {
  const CopyrightSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: isMobile ? 40 : 60),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAsset.logoAppImage,
                height: isMobile ? 60 : 100,
                width: isMobile ? 88 : 150,
              ),
              Text(
                'MockMate.ai',
                style: GoogleFonts.inter(
                  fontSize: isMobile ? 20 : 34,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF334155),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BuildFooterLink(label: 'Privacy'),
                  SizedBox(width: 30),
                  BuildFooterLink(label:'Terms'),
                  SizedBox(width: 30),
                  BuildFooterLink(label:'Support'),
                ],
              ),

          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              '© 2026 MockMate.ai Inc.All rights reserved.',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 16,
                color: const Color(0xFF94A3B8),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: isMobile ? 65 : 20)
        ],
      ),
    );
  }
}