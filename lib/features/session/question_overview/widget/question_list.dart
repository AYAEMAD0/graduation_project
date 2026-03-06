import 'package:flutter/material.dart';

import 'question_content.dart';
import 'question_item_card.dart';

class QuestionList extends StatelessWidget {
  final List<QuestionItem> questions;
  final int currentQuestion;
  final ScrollController scrollController;
  final void Function(int index) onQuestionSelected;
  final void Function(QuestionItem question, int index) onNavigate;

  const QuestionList({
    super.key,
    required this.questions,
    required this.currentQuestion,
    required this.scrollController,
    required this.onQuestionSelected,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      padding: EdgeInsets.zero,
      children: [
        ...questions.asMap().entries.map((entry) {
          final index = entry.key + 1;
          final question = entry.value;
          return QuestionItemCard(
            index: index,
            title: question.title,
            type: question.type,
            isModified: false,
            isActive: index == currentQuestion,
            onTap: () => onQuestionSelected(index),
            onNavigate: () => onNavigate(question, index),
          );
        }),
      ],
    );
  }
}
