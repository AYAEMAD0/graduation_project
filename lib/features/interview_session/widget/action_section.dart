import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';

class ActionSection extends StatelessWidget {

  final VoidCallback onNext;

  const ActionSection({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 60),

        SizedBox(
          width: 200,
          child: CustomButton(
            text: "Next",
            onPressed: onNext,
          ),
        ),

        const SizedBox(height: 30),

        SizedBox(
          width: 200,
          child: CustomButton(
            text: "Flag Question",
            onPressed: () {},
          ),
        ),

        const SizedBox(height: 30),

        SizedBox(
          width: 200,
          child: CustomButton(
            text: "Submit",
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
