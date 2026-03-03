import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/features/question_overview_list/presentation/widget/question_item_card.dart';
import 'package:mock_mate_ai/features/question_overview_list/presentation/widget/submit_test_button.dart';

class QuestionContent extends StatelessWidget {
  const QuestionContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              QuestionItemCard(
                index: 1,
                title: "Balanced Array",
                type: "Coding",
                isModified: false,
              ),
              QuestionItemCard(
                index: 2,
                title: "Prime or Not?",
                type: "Coding",
                isModified: true,
              ),
              QuestionItemCard(
                index: 3,
                title: "Linked List Insertion",
                type: "Multiple Choice",
                isModified: false,
              ),
              QuestionItemCard(
                index: 4,
                title: "Binary Search Tree",
                type: "Coding",
                isModified: false,
              ),
              QuestionItemCard(
                index: 5,
                title: "Stack Implementation",
                type: "Multiple Choice",
                isModified: false,
              ),

              const SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.only(left: 14.0),
                child: Text(
                  "All questions must be submitted before the timer runs out.",
                  style: AppStyle.font16GrayMediumSemiBold,
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(height: 24),
              const SubmitTestButton(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }
}