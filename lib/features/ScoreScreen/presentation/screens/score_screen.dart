import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:mock_mate_ai/core/widget/arrow_button.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';
import 'package:mock_mate_ai/core/widget/success_circle.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoints = ResponsiveBreakpoints.of(context);
    final isMobile = breakpoints.isMobile;
    final horizontalPadding = isMobile ? 12.0 : 24.0;
    final containerMaxWidth = isMobile ? double.infinity : 800.0;

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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: isMobile ? 70 : 80),
                      Text(
                        "Score 90%",
                        style: TextStyle(
                          fontSize: isMobile ? 28 : 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: isMobile ? 30 : 40),
                      const SuccessCircle(),
                      SizedBox(height: isMobile ? 30 : 40),
                      Text(
                        "MCQ vs Coding",
                        style: TextStyle(fontSize: isMobile ? 20 : 30),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Skill performance",
                        style: TextStyle(fontSize: isMobile ? 20 : 30),
                      ),
                      SizedBox(height: 40 ),
                      Row(
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
                      SizedBox(height: isMobile ? 30 : 50),
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