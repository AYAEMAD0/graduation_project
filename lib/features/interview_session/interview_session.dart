import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../core/routes/app_routes.dart';
import 'model/question_model.dart';
import 'widget/header_section.dart';
import 'widget/question_section.dart';
import 'widget/action_section.dart';

class InterviewSession extends StatefulWidget {
  const InterviewSession({super.key});

  @override
  State<InterviewSession> createState() => _InterviewSessionState();
}

class _InterviewSessionState extends State<InterviewSession> {
  int currentIndex = 0;
  late int endTime;

  final List<QuestionModel> questions = QuestionModel.questions;

  @override
  void initState() {
    super.initState();
    endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 15;
  }

  @override
  Widget build(BuildContext context) {
    final breakpoints = ResponsiveBreakpoints.of(context);
    final isMobile = breakpoints.isMobile;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isMobile ? double.infinity : 800,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 16 : 50,
                vertical: 20,
              ),
              child: Column(
                children: [
                  HeaderSection(
                    currentIndex: currentIndex,
                    lengthQuestion: questions.length,
                    endTime: endTime,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: QuestionSection(
                            question: questions[currentIndex],
                          ),
                        ),
                        const SizedBox(height: 20),
                        ActionSection(
                          onNext: () {
                            if (currentIndex < questions.length - 1) {
                              setState(() {
                                currentIndex++;
                              });
                            } else {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                AppRoutes.scoreScreen,
                                    (route) => false,
                              );
                            }
                          },
                        ),
                      ],
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
