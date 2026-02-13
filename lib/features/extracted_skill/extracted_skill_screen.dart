import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_gradient.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';
import 'package:mock_mate_ai/core/widget/custom_toast.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../core/widget/arrow_button.dart';
import 'widget/build_divider.dart' show BuildDivider;
import 'widget/build_skill_row.dart';

class ExtractedSkillScreen extends StatefulWidget {
  const ExtractedSkillScreen({super.key});

  @override
  State<ExtractedSkillScreen> createState() => _ExtractedSkillScreenState();
}

class _ExtractedSkillScreenState extends State<ExtractedSkillScreen> {
  String selectedSkill = "";
  final List<String> skills = ["Data Structure", "C++", "OOP"];

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
            Positioned(top: 16, left: 16, child: const ArrowButton()),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: containerMaxWidth),
                  child: Column(
                    children: [
                      SizedBox(height: 70),
                      Text(
                        "Extracted Skills",
                        style: TextStyle(
                          fontSize: isMobile ? 28 : 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 25,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: AppGradient.primaryGradient,
                        ),
                        child: Column(
                          children: List.generate(skills.length * 2 - 1, (
                            index,
                          ) {
                            if (index.isOdd) {
                              return BuildDivider();
                            }
                            final skill =
                                skills[index ~/ 2];
                            return BuildSkillRow(
                              title: skill,
                              isSelected: selectedSkill == skill,
                              onChanged: (val) {
                                setState(() {
                                  selectedSkill = val ? skill : "";
                                });
                              },
                            );
                          }),
                        ),
                      ),
                      SizedBox(height: 30),
                      CustomButton(
                        text: 'Continue',
                        widthBtn: isMobile?300:400,
                        onPressed: () {
                          if (selectedSkill.isEmpty) {
                            CustomToast.showToast(
                              message: "Please select one skill",
                              context: context,
                            );
                            return;
                          }
                          debugPrint("Selected Skill: $selectedSkill");
                        },
                      ),
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
