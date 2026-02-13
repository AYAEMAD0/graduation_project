import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/core/widget/arrow_button.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../widget/selection_selector.dart';

class InterviewSetupScreen extends StatefulWidget {
  const InterviewSetupScreen({super.key});

  @override
  State<InterviewSetupScreen> createState() => _InterviewSetupScreenState();
}

class _InterviewSetupScreenState extends State<InterviewSetupScreen> {
  int selectedIndex = 0;
  int selectedDifficulty = 1;
  int selectedDuration = 0;

  final List<String> interviewType = ["MCQs", "Coding", "Both"];
  final List<String> difficulty = ["Easy", "Medium", "Hard"];
  final List<String> duration = ["15 min", "30 min", "45 min"];

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    final double horizontalPadding = isMobile ? 12 : 24;
    final double spacingSmall = isMobile ? 10 : 20;
    final double spacingMedium = isMobile ? 30 : 50;
    final double spacingLarge = isMobile ? 70 : 80;
    final double titleFontSize = isMobile ? 28 : 40;
    final double labelFontSize = isMobile ? 18 : 32;
    final double buttonWidth = isMobile ? double.infinity : 500;
    final double containerMaxWidth = isMobile ? double.infinity : 800;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 16,
              left: 16,
              child: const ArrowButton(),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: containerMaxWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: spacingLarge),
                      Center(
                        child: Text(
                          "Interview Setup",
                          style: AppStyle.font40BlackSemiBold
                              .copyWith(fontSize: titleFontSize),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: spacingMedium),
                      Text(
                        "Interview Type:",
                        style: AppStyle.font32BlackBold
                            .copyWith(fontSize: labelFontSize),
                      ),
                      SizedBox(height: spacingSmall),
                      SelectionSelector(
                        items: interviewType,
                        selectedIndex: selectedIndex,
                        onTap: (index) => setState(() => selectedIndex = index),
                      ),
                      SizedBox(height: spacingMedium),
                      Text(
                        "Difficulty:",
                        style: AppStyle.font32BlackBold
                            .copyWith(fontSize: labelFontSize),
                      ),
                      SizedBox(height: spacingSmall ),
                      SelectionSelector(
                        items: difficulty,
                        selectedIndex: selectedDifficulty,
                        onTap: (index) =>
                            setState(() => selectedDifficulty = index),
                      ),

                      SizedBox(height: spacingMedium),
                      Text(
                        "Duration:",
                        style: AppStyle.font32BlackBold
                            .copyWith(fontSize: labelFontSize),
                      ),
                      SizedBox(height: spacingSmall),
                      SelectionSelector(
                        items: duration,
                        selectedIndex: selectedDuration,
                        onTap: (index) =>
                            setState(() => selectedDuration = index),
                      ),
                      SizedBox(height: spacingLarge),
                      Center(
                        child: CustomButton(
                          text: "Start Interview",
                          widthBtn: buttonWidth,
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(height: spacingSmall),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
