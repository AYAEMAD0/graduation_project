import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';

import 'submit_test_button.dart';

class QuestionContentFooter extends StatelessWidget {
  final int sessionId;

  const QuestionContentFooter({
    super.key,
    required this.sessionId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.only(left: 14.0),
          child: Text(
            "All questions must be submitted before the timer runs out.",
            style: AppStyle.font16GrayMediumSemiBold,
          ),
        ),
        const SizedBox(height: 24),
         SubmitTestButton(
          sessionId: sessionId,
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
