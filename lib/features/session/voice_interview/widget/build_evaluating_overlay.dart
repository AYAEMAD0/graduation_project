import 'package:flutter/material.dart';

class EvaluatingOverlay extends StatelessWidget {
  const EvaluatingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            color: Colors.blueAccent,
            strokeWidth: 3,
          ),
          const SizedBox(height: 24),
          const Text(
            "Evaluating your performance...",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "The AI is generating your score and feedback.",
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.5),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
