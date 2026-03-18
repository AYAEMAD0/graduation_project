import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mock_mate_ai/core/constants/app_asset.dart';
import 'dart:ui';
import 'package:mock_mate_ai/features/feedback/widget/info_card.dart';
import 'package:mock_mate_ai/features/feedback/widget/overall_summary_card.dart';
import 'package:mock_mate_ai/features/feedback/widget/question_feedback_card.dart';
import 'package:mock_mate_ai/features/feedback/widget/section_header.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -200,
            left: -200,
            child: Container(
              width: 889.71,
              height: 889.71,
              decoration: BoxDecoration(
                color: const Color(0x3306B6D4),
                borderRadius: BorderRadius.circular(34750.98),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 278.03, sigmaY: 278.03),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),

          Positioned(
            top: 200,
            right: -250,
            child: Container(
          
              decoration: BoxDecoration(
                color: const Color(0x33A855F7),
                borderRadius: BorderRadius.circular(34750.98),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 278.0357, sigmaY: 278.0357),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),

          Center(
            child: SingleChildScrollView(
              child: Container(
                width: 1414,
                constraints: const BoxConstraints(maxWidth: 1414),
                padding: const EdgeInsets.fromLTRB(22.09, 66.28, 22.09, 66.28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Performance Feedback",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w900,
                        fontSize: 66.28,
                        height: 1,
                        color: Color(0xff000000),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Detailed analysis of your Technical Mock Interview - Senior Software Engineer Role",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w400,
                        fontSize: 24.86,
                        height: 1.55,
                        color: Color(0xff263238),
                      ),
                    ),
                    const SizedBox(height: 60),

                    OverallSummaryCard(
                      summary:
                          "The candidate shows a solid understanding of core concepts, demonstrating clear logic in problem-solving. Performance was consistent across technical domainswith particularly strongcommunication skills. While the algorithmic approach wassound, there is room for optimizationin space complexity and more defensive programming patterns.",
                      score: "88",
                    ),
                    const SizedBox(height: 50),
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          InfoCard(
                            backgroundColor: const Color(0x0D06F916),
                            headerIcon: AppAsset.strength,
                            title: "Strengths",
                            descriptionIcon: Icons.done_all,
                            descriptionIconColor: const Color(0xff10B981),
                            descriptions: const [
                              "Clean code formatting and adherence to naming conventions.",
                              "Proper use of built-in array manipulation functions for efficiency.",
                              "Excellent verbal articulation of thought process during coding.",
                              "Proactive handling of edge cases for null inputs.",
                            ],
                            descriptionIconSize: 15,
                          ),
                          const SizedBox(width: 33.14),
                          InfoCard(
                            backgroundColor: const Color(0x0DF937A6),

                            headerIcon: AppAsset.error,
                            title: "Weaknesses",
                            descriptionIcon: Icons.priority_high,
                            descriptionIconColor: const Color(0xffF59E0B),
                            descriptions: const [
                              "Initial approach to the problem was less optimal, leading to a higher time complexity.",
                              "Missed an opportunity to use a more efficient data structure for tracking seen numbers.",
                              "Minor syntax errors that could be avoided with more careful review.",
                              "Could benefit from more practice with algorithmic problem solving under time constraints.",
                            ],
                            descriptionIconSize: 23.76,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 90),
                    const SectionHeader(
                      title: "Detailed Feedback per Question",
                    ),
                    const SizedBox(height: 90),
                    Column(
                      spacing: 40,
                      children: [
                        QuestionFeedbackCard(
                          number: 1,
                          title: "Two Problem",
                          status: "Passed",
                          feedback:
                              "Your approach to the Two Sum problem was logical and the code was syntactically correct. You correctly identified that a hash mapcould reduce the time complexity from O(n²) to O(n).",
                          suggestion:
                              'While the hash map is great, always verify if the array is sorted first. If it is, a two-pointer approach might be even more space-efficient (O(1) auxiliary space).',
                          baseColor: Color(0xff10B981),
                        ),
                        
                        QuestionFeedbackCard(
                          number: 2,
                          title: "Longest Substring Without Repeating Characters",
                          status: "Needs Improvement",
                          feedback:
                              "You struggled with the sliding window logic, resulting in redundant iterations over the string. The initial implementation failed on edge cases containing unique symbols like whitespace or punctuation.",
                          suggestion:
                              'Practice the "Sliding Window" pattern. Instead of a simple set, use a Dictionary to store the index of characters. This allows you to jump the start of the window directly instead of incrementing one by one.',
                          baseColor: Color(0xffFBBF24),
                        ),
                          QuestionFeedbackCard(
                          number: 3,
                          title: "Reverse Linked List",
                          status: "Skipped",
                          feedback:
                              "You struggled with the sliding window logic, resulting in redundant iterations over the string. The initial implementation failed on edge cases containing unique symbols like whitespace or punctuation.",
                          suggestion:
                              'Practice the "Sliding Window" pattern. Instead of a simple set, use a Dictionary to store the index of characters. This allows you to jump the start of the window directly instead of incrementing one by one.',
                          baseColor: Color(0xff3C473F),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
