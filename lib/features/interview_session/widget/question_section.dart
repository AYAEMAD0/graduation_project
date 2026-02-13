import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:mock_mate_ai/features/interview_session/model/question_model.dart';
import 'package:mock_mate_ai/features/interview_session/widget/option_item.dart';

class QuestionSection extends StatefulWidget {
  final QuestionModel question;

  const QuestionSection({
    super.key,
    required this.question,
  });

  @override
  State<QuestionSection> createState() => _QuestionSectionState();
}

class _QuestionSectionState extends State<QuestionSection> {

  String? selectedOption;

  @override
  Widget build(BuildContext context) {

    final breakpoints = ResponsiveBreakpoints.of(context);
    final isMobile = breakpoints.isMobile;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 0 : (isMobile ? 80 : 30),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Question Title
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColor.whiteDarkColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                widget.question.question,
                style: TextStyle(
                  fontSize: isMobile ? 16 : 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const SizedBox(height: 20),
            /// Options Container
            Container(
              padding: EdgeInsets.all(isMobile ? 16 : 20),
              decoration: BoxDecoration(
                color:  AppColor.whiteDarkColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.question.options.map((option) {
                  return OptionItem(
                    text: option,
                    isSelected: selectedOption == option,
                    onTap: () {
                      setState(() {
                        selectedOption = option;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
