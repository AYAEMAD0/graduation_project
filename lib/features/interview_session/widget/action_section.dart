import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';

class ActionSection extends StatelessWidget {
  final VoidCallback onNext;

  const ActionSection({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth;

      
        final useExpanded = availableWidth < 420;

        return Padding(
          padding: EdgeInsets.only(bottom: isMobile ? 24 : 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              useExpanded
                  ? Expanded(
                      child: CustomButton(
                        text: "Next",
                        onPressed: onNext,
                      ),
                    )
                  : SizedBox(
                      width: 200,
                      child: CustomButton(
                        text: "Next",
                        onPressed: onNext,
                      ),
                    ),

              const SizedBox(width: 30),

              useExpanded
                  ? Expanded(
                      child: CustomButton(
                        text: "Submit",
                        onPressed: () {},
                      ),
                    )
                  : SizedBox(
                      width: 200,
                      child: CustomButton(
                        text: "Submit",
                        onPressed: () {},
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}