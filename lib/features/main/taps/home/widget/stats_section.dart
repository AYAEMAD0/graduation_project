import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:responsive_framework/responsive_framework.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    
    final bool isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final bool isTablet = ResponsiveBreakpoints.of(context).isTablet;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: isMobile ? 10 : 30),
      child: Flex(
        
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem(
            context,
            "10k+",
            "Interviews Conducted",
            AppColor.purple,
            isMobile,
            isTablet,
          ),
          if (isMobile) const SizedBox(height: 50), 
          _buildStatItem(
            context,
            "92%",
            "Success Rate",
            const Color(0xFF0EA5E9),
            isMobile,
            isTablet,
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String value,
    String label,
    Color color,
    bool isMobile,
    bool isTablet,
  ) {
    
    double valueFontSize;
    if (isMobile) {
      valueFontSize = 60; 
    } else if (isTablet) {
      valueFontSize = 80; 
    } else {
      valueFontSize = 101.54; 
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
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