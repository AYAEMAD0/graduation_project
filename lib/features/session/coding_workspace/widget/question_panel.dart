import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/helper/question_parser_helper.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/features/session/coding_workspace/widget/constraints_section.dart';
import 'package:mock_mate_ai/features/session/coding_workspace/widget/example_card.dart';

import '../../../../domain/entities/session/interview_session/interview_session_entity.dart';
import '../widget/custom_expansion_header.dart';
import '../widget/sample_case_card.dart';
import '../widget/status_chip.dart';

class QuestionPanel extends StatelessWidget {
  final int questionNumber;
  final String questionTitle;
  final String questionText;
  final List<TestCaseEntity> testCases;

  const QuestionPanel({
    super.key,
    required this.questionNumber,
    required this.questionTitle,
    required this.questionText,
    required this.testCases,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Problem $questionNumber",
                style: AppStyle.font16BlackBold.copyWith(
                  fontSize: 12,
                  color: AppColor.purple,
                ),
              ),
              StatusChip(
                color: AppColor.darkGray,
                label: "Coding",
                backgroundColor: AppColor.slate200,
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            questionTitle,
            style: AppStyle.font32BlackBold.copyWith(
              fontSize: 25,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Text(
              QuestionParserHelper.description(questionText),
              style: AppStyle.font14GrayMedium.copyWith(
                color: isDark ? const Color(0xff94A3B8) : AppColor.darkGray,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ExampleCard(
            inputExample: QuestionParserHelper.exampleInput(questionText),
            outputExample: QuestionParserHelper.exampleOutput(questionText),
          ),
          ConstraintsSection(
            descConstraints: QuestionParserHelper.constraints(questionText),
          ),
          const SizedBox(height: 16),
          const CustomExpansionHeader(),
          const SizedBox(height: 6),
          SampleCaseCard(testCases: testCases),
        ],
      ),
    );
  }
}
