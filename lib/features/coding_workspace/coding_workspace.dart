import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/features/coding_workspace/widget/code_editor_panel.dart';
import 'package:mock_mate_ai/features/coding_workspace/widget/constraints_section.dart';
import 'package:mock_mate_ai/features/coding_workspace/widget/custom_expansion_header.dart';
import 'package:mock_mate_ai/features/coding_workspace/widget/example_card.dart';
import 'package:mock_mate_ai/features/coding_workspace/widget/sample_case_card.dart';
import 'package:mock_mate_ai/features/coding_workspace/widget/status_chip.dart';

class CodingWorkspace extends StatelessWidget {
  const CodingWorkspace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Problem 02",
                      style: AppStyle.font16BlackBold.copyWith(
                        fontSize: 16,
                        color: AppColor.purple,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Prime or Not?",
                      style: AppStyle.font32BlackBold.copyWith(fontSize: 25),
                    ),
                    SizedBox(height: 20),
                    Row(
                      spacing: 8,
                      children: [
                        StatusChip(
                          color: AppColor.darkGray,
                          label: "Coding",
                          backgroundColor: AppColor.slate200,
                        ),
                        StatusChip(
                          color: AppColor.purple,
                          label: "Easy",
                          backgroundColor: AppColor.purple.withValues(
                            alpha: 0.10,
                          ),
                        ),
                        StatusChip(
                          color: AppColor.darkGray,
                          label: "Score: 20",
                          backgroundColor: AppColor.slate200,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                        style: AppStyle.font14GrayMedium.copyWith(
                          color: AppColor.darkGray,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: "Given an integer, if the number is prime,\n",
                          ),
                          TextSpan(
                            text: "return 1. Otherwise return its smallest\n",
                          ),
                          TextSpan(text: "divisor greater than 1."),
                        ],
                      ),
                    ),
                    ExampleCard(
                      inputExample: "`n = 24`",
                      explanation:
                          "The number 24 is not prime: its divisors are\n [1, 2, 3, 4, 6, 8, 12, 24]. The smallest divisor\n greater than 1 is 2.",
                    ),
                    ConstraintsSection(),
                    SizedBox(height: 20),
                    CustomExpansionHeader(),
                    SizedBox(height: 20),
                    SampleCaseCard(),
                  ],
                ),
              ),
            ),
            Expanded(flex: 8, child: CodeEditor()),
          ],
        ),
      ),
    );
  }
}
