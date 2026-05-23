import 'dart:ui';

import 'package:flutter/material.dart';

class CardFaq extends StatelessWidget {
  const CardFaq({super.key, required this.title, required this.desc});

  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return ClipRRect(
      borderRadius: BorderRadius.circular(35.63),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 32.63, sigmaY: 32.63),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0x0DA806F9),
            borderRadius: BorderRadius.circular(35.63),
            border: Border.all(color: const Color(0x1AA806F9), width: 2),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: isDark ? Colors.white : Colors.black,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                desc,
                style:  TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: isDark ? const Color(0xff94A3B8) : const Color(0xff64748B),
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
