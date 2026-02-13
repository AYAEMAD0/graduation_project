import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:mock_mate_ai/core/widget/arrow_button.dart';
import 'package:mock_mate_ai/features/interview_session/model/QuestionModel.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

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
    final isDesktop = breakpoints.isDesktop;

    double progress = (currentIndex + 1) / questions.length;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isDesktop ? 1200 : double.infinity,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 16 : 50,
                vertical: 20,
              ),
              child: Column(
                children: [
              
                  Stack(
                    alignment: Alignment.center,
                    children: const [
                      Align(
                        alignment: Alignment.centerLeft,
                        child:ArrowButton()
                      ),
                      Text(
                        "Interview Session",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Text(
                        "Question ${currentIndex + 1}/${questions.length}",
                        style: TextStyle(
                          fontSize: isMobile ? 18 : 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Icon(Icons.timer_outlined),
                          const SizedBox(width: 8),
                          CountdownTimer(
                            endTime: endTime,
                            widgetBuilder: (_, time) {
                              if (time == null) {
                                return const Text("00:00");
                              }
                              final minutes = (time.min ?? 0)
                                  .toString()
                                  .padLeft(2, '0');
                              final seconds = (time.sec ?? 0)
                                  .toString()
                                  .padLeft(2, '0');

                              return Text(
                                "$minutes:$seconds",
                                style: TextStyle(
                                  fontSize: isMobile ? 18 : 24,
                                  color:
                                      (time.min == 0 && (time.sec ?? 0) <= 10)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  /// Progress Bar
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return LinearPercentIndicator(
                        width: constraints.maxWidth,
                        lineHeight: isMobile ? 10 : 25,
                        percent: progress,
                        animation: false,
                        backgroundColor: Colors.grey.shade300,
                        barRadius: const Radius.circular(12),
                        linearGradient: const LinearGradient(
                          colors: [Color(0xff7F7FD5), Color(0xffE684AE)],
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 40),
                  Expanded(
                    child: isMobile
                        ? Column(
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
                                  }
                                },
                              ),
                            ],
                          )
                        : Column(
                          children: [
                            Expanded(
                              flex: 6,
                              child: QuestionSection(
                                question: questions[currentIndex],
                              ),
                            ),
                            const SizedBox(width: 50),
                            Expanded(
                              flex: 4,
                              child: ActionSection(
                                onNext: () {
                                  if (currentIndex < questions.length - 1) {
                                    setState(() {
                                      currentIndex++;
                                    });
                                  }
                                },
                              ),
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
