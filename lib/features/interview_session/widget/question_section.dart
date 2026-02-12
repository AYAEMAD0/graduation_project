import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:mock_mate_ai/features/interview_session/model/QuestionModel.dart';
import 'package:mock_mate_ai/features/interview_session/widget/OptionItem.dart';

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
    final isTablet = breakpoints.isTablet;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 0 : (isTablet ? 30 : 80),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Question Title
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xffEDEDED),
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
              padding: EdgeInsets.all(isMobile ? 16 : 30),
              decoration: BoxDecoration(
                color: const Color(0xffEDEDED),
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
