import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/routes/app_routes.dart';

import '../../../../domain/entities/session/interview_session/interview_session_entity.dart';
import '../../widget/question_sidebar.dart';
import 'question_list.dart';


class QuestionContent extends StatelessWidget {
  final InterviewSessionEntity interviewSession;
  final int currentQuestion;
  final int remainingSeconds;
  final void Function(int index) onQuestionSelected;
  final ScrollController scrollController;
  final List<SidebarQuestion> sidebarQuestions;
  final Map<int, int> selectedAnswers;
  final void Function(int q, int a) onAnswerSelected;
  final Set<int> savedQuestions;
  final void Function(int) onQuestionSaved;

  const QuestionContent({
    super.key,
    required this.interviewSession,
    required this.currentQuestion,
    required this.remainingSeconds,
    required this.onQuestionSelected,
    required this.scrollController,
    required this.sidebarQuestions,
    required this.selectedAnswers,
    required this.onAnswerSelected,
    required this.savedQuestions,
    required this.onQuestionSaved,
  });

  void _navigateToQuestion(BuildContext context, QuestionItem question,
      int index) {
    final baseArgs = {
      'currentQuestion': index,
      'totalQuestions': interviewSession.codingQuestions.length +
          interviewSession.mcqQuestions.length,
      'remainingSeconds': remainingSeconds,
      'questions': sidebarQuestions,
      'selectedAnswers': selectedAnswers,
      'onAnswerSelected': (int q, int a) => onAnswerSelected(q, a),
      'onQuestionSelected': onQuestionSelected,
      'sessionId': interviewSession.interviewSessionId,
      'savedQuestions': savedQuestions,
      'onQuestionSaved': (int id) => onQuestionSaved(id),
    };

    if (question.type == "Coding") {
      Navigator.pushNamed(context, AppRoutes.codeWorkspace, arguments: {
        ...baseArgs,
        'questionId': question.id,
        'questionTitle': question.title,
        'questionText': question.questionText ?? '',
        'testCases': question.testCases ?? [],
        'templates': question.templates ?? [],
      });
    } else {
      Navigator.pushNamed(context, AppRoutes.mcqWorkspace, arguments: {
        ...baseArgs,
        'questionId': question.id,
        'questionText': question.title,
        'options': question.options,
        'initialSelectedAnswer': selectedAnswers[question.id],
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final questions = [
      ...interviewSession.codingQuestions.map(
            (q) =>
            QuestionItem(
              id: q.questionId,
              title: q.quesTitle,
              type: "Coding",
              options: const [],
              questionText: q.questionText,
              testCases: q.testCases,
              templates: q.templates,
            ),
      ),
      ...interviewSession.mcqQuestions.map(
            (q) =>
            QuestionItem(
              id: q.questionId,
              title: q.questionText,
              type: "Multiple Choice",
              options: q.options,
            ),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: QuestionList(
            questions: questions,
            currentQuestion: currentQuestion,
            scrollController: scrollController,
            onQuestionSelected: onQuestionSelected,
            onNavigate: (q, i) => _navigateToQuestion(context, q, i),
          ),
        ),
      ],
    );
  }
}

class QuestionItem {
  final int id;
  final String title;
  final String type;
  final List<McqOptionEntity> options;
  final String? questionText;
  final List<TestCaseEntity>? testCases;
  final List<CodeTemplateEntity>? templates;

  const QuestionItem({
    required this.id,
    required this.title,
    required this.type,
    required this.options,
    this.questionText,
    this.testCases,
    this.templates,
  });
}
