import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildFooterLink extends StatelessWidget {
  const BuildFooterLink({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 16,
            color: const Color(0xFF64748B),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
