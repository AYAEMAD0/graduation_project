import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/core/widget/arrow_button.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';
import 'package:mock_mate_ai/features/InterviewSetup/presentation/widget/SelectionSelector.dart';
import 'package:responsive_framework/responsive_framework.dart';

class InterviewSetupScreen extends StatefulWidget {
  const InterviewSetupScreen({super.key});

  @override
  State<InterviewSetupScreen> createState() => _InterviewSetupScreenState();
}

class _InterviewSetupScreenState extends State<InterviewSetupScreen> {
  int selectedIndex = 0;
  int selectedDifficulty = 1;
  int selectedDuration = 0;

  List<String> interviewType = ["MCQs", "Coding", "Both"];
  List<String> difficulty = ["Easy", "Medium", "Hard"];
  List<String> duration = ["15 min", "30 min", "45 min"];

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  ArrowButton(),
                  const SizedBox(height: 20),

                  Center(
                    child: Text(
                      "Interview Setup",
                      style: AppStyle.font40BlackSemiBold,
                    ),
                  ),

                  const SizedBox(height: 32),

                  Text("Interview Type:", style: AppStyle.font32BlackBold),
                  const SizedBox(height: 20),

                  SelectionSelector(
                    items: interviewType,
                    selectedIndex: selectedIndex,
                    onTap: (index) {
                      setState(() => selectedIndex = index);
                    },
                  ),

                  const SizedBox(height: 25),

                  Text("Difficulty:", style: AppStyle.font32BlackBold),
                  const SizedBox(height: 20),

                  SelectionSelector(
                    items: difficulty,
                    selectedIndex: selectedDifficulty,
                    onTap: (index) {
                      setState(() => selectedDifficulty = index);
                    },
                  ),

                  const SizedBox(height: 25),

                  Text("Duration:", style: AppStyle.font32BlackBold),
                  const SizedBox(height: 20),

                  SelectionSelector(
                    items: duration,
                    selectedIndex: selectedDuration,
                    onTap: (index) {
                      setState(() => selectedDuration = index);
                    },
                  ),

                  const SizedBox(height: 30),

                  Center(
                    child: CustomButton(
                      text: "Start Interview",
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
