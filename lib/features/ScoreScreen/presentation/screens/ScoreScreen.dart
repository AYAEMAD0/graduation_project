import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/core/widget/arrow_button.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';
import 'package:mock_mate_ai/core/widget/success_circle.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double horizontalPadding = ResponsiveValue<double>(
      context,
      defaultValue: 16,
      conditionalValues: const [
        Condition.smallerThan(name: MOBILE, value: 12),
        Condition.largerThan(name: TABLET, value: 24),
      ],
    ).value!;

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: Center(
          child: ResponsiveConstraints(
            constraint: const BoxConstraints(maxWidth: 900),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: ArrowButton(),
                  ),

                  const SizedBox(height: 30),

                  Text(
                    "Score 90%",
                    style: AppStyle.font40BlackSemiBold,
                  ),

                  const SizedBox(height: 40),

                  const SuccessCircle(),

                  const SizedBox(height: 30),

                  Text(
                    "MCQ vs Coding",
                    style: AppStyle.font25BlackLight,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Skill performance",
                    style: AppStyle.font25BlackLight,
                  ),

                  const SizedBox(height: 40),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: "View Details",
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: CustomButton(
                          text: "Back to Home",
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
