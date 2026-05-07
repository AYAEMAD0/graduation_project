import 'package:flutter/material.dart';

class LoadingLine extends StatelessWidget {
  const LoadingLine({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 15,
      child: LinearProgressIndicator(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFA806F9),
        backgroundColor: const Color(0xFFA806F9).withValues(alpha: 0.2),
      ),
    );
  }
}
