import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mock_mate_ai/core/constants/app_asset.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'build_footer_link.dart';

class CopyrightSection extends StatefulWidget {
  const CopyrightSection({super.key});

  @override
  State<CopyrightSection> createState() => _CopyrightSectionState();
}

class _CopyrightSectionState extends State<CopyrightSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _float;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )
      ..repeat(reverse: true);

    _float = Tween<double>(
      begin: -8.0,
      end: 8.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: isMobile ? 40 : 60),
      child: Column(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _float.value),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAsset.logoAppImage,
                      height: isMobile ? 60 : 100,
                      width: isMobile ? 88 : 150,
                    ),
                    const SizedBox(width: 10),
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
              );
            },
          ),

          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 37),
              BuildFooterLink(label: 'Privacy'),
              const SizedBox(width: 47),
              BuildFooterLink(label: 'Terms'),
              const SizedBox(width: 47),
              BuildFooterLink(label: 'Support'),
            ],
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              '          © 2026 MockMate.ai Inc. All rights reserved.',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 16,
                color: const Color(0xFF94A3B8),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: isMobile ? 65 : 20),
        ],
      ),
    );
  }
}