import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_mate_ai/core/config/di.dart';
import 'package:mock_mate_ai/core/helper/question_parser_helper.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/features/session/coding_workspace/widget/constraints_section.dart';
import 'package:mock_mate_ai/features/session/coding_workspace/widget/example_card.dart';
import 'package:mock_mate_ai/features/session/viewmodel/submit_code/submit_code_cubit.dart';

import '../../../../domain/entities/session/interview_session/interview_session_entity.dart';
import '../../session_layout.dart';
import '../../widget/question_sidebar.dart';
import '../widget/code_editor_panel.dart';
import '../widget/custom_expansion_header.dart';
import '../widget/sample_case_card.dart';
import '../widget/status_chip.dart';

class CodingWorkspace extends StatelessWidget {
  final int currentQuestion;
  final int totalQuestions;
  final int remainingSeconds;
  final List<SidebarQuestion> questions;
  final void Function(int) onQuestionSelected;
  final Map<int, int> selectedAnswers;
  final void Function(int q, int a) onAnswerSelected;
  final String questionTitle;
  final String questionText;
  final List<TestCaseEntity> testCases;
  final List<CodeTemplateEntity> templates;
  final int sessionId;
  final int questionId;
  final Map<int, String> savedCode;
  final void Function(int, String) onCodeChanged;

  const CodingWorkspace({
    super.key,
    required this.currentQuestion,
    required this.totalQuestions,
    required this.remainingSeconds,
    required this.questions,
    required this.onQuestionSelected,
    required this.selectedAnswers,
    required this.onAnswerSelected,
    required this.questionTitle,
    required this.questionText,
    required this.testCases,
    required this.templates,
    required this.sessionId,
    required this.questionId,
    required this.savedCode,
    required this.onCodeChanged,
  });

  String get _formattedTime {
    final minutes = remainingSeconds ~/ 60;
    final seconds = remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return SessionLayout(
      time: _formattedTime,
      currentQuestion: currentQuestion,
      totalQuestions: totalQuestions,
      remainingSeconds: remainingSeconds,
      questions: questions,
      onQuestionSelected: onQuestionSelected,
      onAnswerSelected: onAnswerSelected,
      selectedAnswers: selectedAnswers,
      sessionId: sessionId,
      body: BlocProvider(
        create: (context) => getIt<SubmitCodeCubit>(),
        child: Container(
          color: const Color(0xffF8FAFC),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Problem $currentQuestion",
                              style: AppStyle.font16BlackBold.copyWith(
                                fontSize: 12,
                                color: AppColor.purple,
                              ),
                            ),
                            StatusChip(
                              color: AppColor.darkGray,
                              label: "Coding",
                              backgroundColor: AppColor.slate200,
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          questionTitle,
                          style: AppStyle.font32BlackBold.copyWith(
                              fontSize: 25),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Text(
                            QuestionParserHelper.description(questionText),
                            style: AppStyle.font14GrayMedium.copyWith(
                              color: AppColor.darkGray,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        ExampleCard(
                          inputExample: QuestionParserHelper.exampleInput(
                              questionText),
                          outputExample: QuestionParserHelper.exampleOutput(
                              questionText),
                        ),
                        ConstraintsSection(
                          descConstraints: QuestionParserHelper.constraints(
                              questionText),
                        ),
                        const SizedBox(height: 16),
                        const CustomExpansionHeader(),
                        const SizedBox(height: 6),
                        SampleCaseCard(testCases: testCases),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: CodeEditor(
                    templates: templates,
                    testCases: testCases,
                    sessionId: sessionId,
                    questionId: questionId,
                    savedCode: savedCode,
                    onCodeChanged: onCodeChanged,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}