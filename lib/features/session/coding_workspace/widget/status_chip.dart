import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatusChip extends StatelessWidget {
  final Color color;
  final String label;
  final Color backgroundColor;
  const StatusChip({
    super.key,
    required this.color,
    required this.label,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Text(
        label,
        style: GoogleFonts.roboto(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.1,
        ),
      ),
    );
  }
}
