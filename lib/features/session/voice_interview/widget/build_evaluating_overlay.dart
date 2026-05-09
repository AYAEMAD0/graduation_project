import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';

class EvaluatingOverlay extends StatelessWidget {
  const EvaluatingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: Colors.blueAccent,
            strokeWidth: 4,
          ),
          const SizedBox(height: 24),
          Text(
            "Evaluating your performance...",
              style: AppStyle.font18BlackSemiBold
          ),
          const SizedBox(height: 8),
          Text(
            "The AI is generating your score and feedback.",
              style: AppStyle.font12Black87.copyWith(fontSize: 14)
          ),
        ],
      ),
    );
  }
}
