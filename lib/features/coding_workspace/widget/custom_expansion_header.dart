import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';

class CustomExpansionHeader extends StatelessWidget {
  const CustomExpansionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.slate200.withValues(alpha: 0.50),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      child: Row(
        children: const [
          Expanded(
            child: Text(
              "Input Format for Custom Testing",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF111827),
              ),
            ),
          ),
          Icon(Icons.keyboard_arrow_down, size: 26, color: AppColor.slateDark),
        ],
      ),
    );
  }
}
