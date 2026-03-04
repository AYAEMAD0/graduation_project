import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import '../../../../../domain/entities/interview_session/interview_session_entity.dart';
import '../../widget/question_sidebar.dart';
import 'question_item_card.dart';
import 'submit_test_button.dart';

class QuestionContent extends StatelessWidget {
  final InterviewSessionEntity interviewSession;
  final int currentQuestion;
  final int remainingSeconds;
  final void Function(int index) onQuestionSelected;
  final ScrollController scrollController;
  final List<SidebarQuestion> sidebarQuestions;

  const QuestionContent({
    super.key,
    required this.interviewSession,
    required this.currentQuestion,
    required this.remainingSeconds,
    required this.onQuestionSelected,
    required this.scrollController,
    required this.sidebarQuestions,
  });

  @override
  Widget build(BuildContext context) {
    final totalQuestions =
        interviewSession.codingQuestions.length +
        interviewSession.mcqQuestions.length;

    // coding first then mcq — same order as _sidebarQuestions
    final questions = [
      ...interviewSession.codingQuestions.map(
        (q) =>
            _QuestionItem(id: q.questionId, title: q.quesTitle, type: "Coding"),
      ),
      ...interviewSession.mcqQuestions.map(
        (q) => _QuestionItem(
          id: q.questionId,
          title: q.questionText,
          type: "Multiple Choice",
        ),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView(
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
                  totalQuestions: totalQuestions,
                  remainingSeconds: remainingSeconds,
                  sidebarQuestions: sidebarQuestions,
                  onTap: () => onQuestionSelected(index),
                );
              }),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: Text(
                  "All questions must be submitted before the timer runs out.",
                  style: AppStyle.font16GrayMediumSemiBold,
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

class _QuestionItem {
  final int id;
  final String title;
  final String type;

  const _QuestionItem({
    required this.id,
    required this.title,
    required this.type,
  });
}
