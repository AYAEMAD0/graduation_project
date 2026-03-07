import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/routes/app_routes.dart';

import '../../../../domain/entities/session/interview_session/interview_session_entity.dart';
import '../../model/session_arguments.dart';
import 'question_list.dart';


class QuestionContent extends StatelessWidget {
  final InterviewSessionEntity interviewSession;
  final SessionArguments sessionArgs;
  final ScrollController scrollController;

  const QuestionContent({
    super.key,
    required this.interviewSession,
    required this.sessionArgs,
    required this.scrollController,
  });

  void _navigateToQuestion(BuildContext context, QuestionItem question,
      int index) {
    final args = {
      'sessionArgs': sessionArgs.copyWith(currentQuestion: index),
    };

    if (question.type == "Coding") {
      Navigator.pushNamed(context, AppRoutes.codeWorkspace, arguments: {
        ...args,
        'questionId': question.id,
        'questionTitle': question.title,
        'questionText': question.questionText ?? '',
        'testCases': question.testCases ?? [],
        'templates': question.templates ?? [],
      });
    } else {
      Navigator.pushNamed(context, AppRoutes.mcqWorkspace, arguments: {
        ...args,
        'questionId': question.id,
        'questionText': question.title,
        'options': question.options,
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
            currentQuestion: sessionArgs.currentQuestion,
            scrollController: scrollController,
            onQuestionSelected: sessionArgs.onQuestionSelected,
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