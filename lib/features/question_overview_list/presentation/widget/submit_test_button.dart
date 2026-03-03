import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_gradient.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SubmitTestButton extends StatelessWidget {
  const SubmitTestButton({super.key});

  @override
  Widget build(BuildContext context) {
    double btnWidth = ResponsiveValue<double>(
      context,
      defaultValue: 300,
      conditionalValues: [
        const Condition.smallerThan(name: MOBILE, value: 250),
      ],
    ).value;

    return Center(
      child: CustomButton(
        gradient: AppGradient.primaryGradient,
        onPressed: () {},
        widthBtn: btnWidth,
        height: 60,
        borderRadius: 20,
        hasShadow: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Submit Test", style: AppStyle.font18WhiteBold),
            const SizedBox(width: 12),
            const Icon(Icons.check_circle, color: Colors.white, size: 24),
          ],
        ),
      ),
    );
  }
}
