import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/features/session/coding_workspace/widget/code_editor_panel.dart';
import 'package:mock_mate_ai/features/session/coding_workspace/widget/constraints_section.dart';
import '../../session_layout.dart';
import '../../widget/question_sidebar.dart';
import '../widget/custom_expansion_header.dart';
import '../widget/example_card.dart';
import '../widget/sample_case_card.dart';
import '../widget/status_chip.dart';

class CodingWorkspace extends StatelessWidget {
  final int currentQuestion;
  final int totalQuestions;
  final int remainingSeconds;
  final List<SidebarQuestion> questions;
  final void Function(int) onQuestionSelected;

  const CodingWorkspace({
    super.key,
    required this.currentQuestion,
    required this.totalQuestions,
    required this.remainingSeconds,
    required this.questions,
    required this.onQuestionSelected,
  });

  String get _formattedTime {
    final minutes = remainingSeconds ~/ 60;
    final seconds = remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return SessionLayout(
      time: _formattedTime,
      currentQuestion: currentQuestion,
      totalQuestions: totalQuestions,
      remainingSeconds: remainingSeconds,
      questions: questions,
      onQuestionSelected: onQuestionSelected,
      body: Container(
        color: const Color(0xffF8FAFC),
        child: Padding(
          padding: const EdgeInsets.all(20),
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
                          fontSize: 12,
                          color: AppColor.purple,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Prime or Not?",
                        style: AppStyle.font32BlackBold.copyWith(fontSize: 25),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        spacing: 8,
                        children: [
                          StatusChip(
                            color: AppColor.darkGray,
                            label: "Coding",
                            backgroundColor: AppColor.slate200,
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Text(
                          "Given an integer, if the number is prime, return 1. Otherwise return its smallest divisor greater than 1.",
                          style: AppStyle.font14GrayMedium.copyWith(
                            color: AppColor.darkGray,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      ExampleCard(
                        inputExample: "`n = 24`",
                        explanation:
                            "The number 24 is not prime: its divisors are\n [1, 2, 3, 4, 6, 8, 12, 24]. The smallest divisor\n greater than 1 is 2.",
                      ),
                      const ConstraintsSection(),
                      const SizedBox(height: 20),
                      const CustomExpansionHeader(),
                      const SizedBox(height: 20),
                      const SampleCaseCard(),
                    ],
                  ),
                ),
              ),
              const Expanded(flex: 6, child: CodeEditor()),
            ],
          ),
        ),
      ),
    );
  }
}