import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_mate_ai/core/config/di.dart';
import 'package:mock_mate_ai/core/helper/question_parser_helper.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/features/session/coding_workspace/viewmodel/submit_code/submit_code_cubit.dart';
import 'package:mock_mate_ai/features/session/coding_workspace/widget/constraints_section.dart';
import 'package:mock_mate_ai/features/session/coding_workspace/widget/example_card.dart';

import '../../../../domain/entities/session/interview_session/interview_session_entity.dart';
import '../../model/session_arguments.dart';
import '../../session_layout.dart';
import '../viewmodel/code_editor/code_editor_cubit.dart';
import '../viewmodel/run_code/run_code_cubit.dart';
import '../widget/code_editor_panel.dart';
import '../widget/custom_expansion_header.dart';
import '../widget/sample_case_card.dart';
import '../widget/status_chip.dart';

class CodingWorkspace extends StatelessWidget {
  final SessionArguments args;
  final String questionTitle;
  final String questionText;
  final List<TestCaseEntity> testCases;
  final List<CodeTemplateEntity> templates;
  final int questionId;
  final Map<int, String> savedCode;
  final void Function(int, String) onCodeChanged;

  const CodingWorkspace({
    super.key,
    required this.args,
    required this.questionTitle,
    required this.questionText,
    required this.testCases,
    required this.templates,
    required this.questionId,
    required this.savedCode,
    required this.onCodeChanged,
  });

  String get _formattedTime {
    final minutes = args.remainingSeconds ~/ 60;
    final seconds = args.remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(
        2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return SessionLayout(
      time: _formattedTime,
      args: args,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => getIt<CodeEditorCubit>()),
          BlocProvider(create: (_) => getIt<RunCodeCubit>()),
          BlocProvider(create: (_) => getIt<SubmitCodeCubit>()),
        ],
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
                              "Problem ${args.currentQuestion}",
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
                          inputExample:
                          QuestionParserHelper.exampleInput(questionText),
                          outputExample:
                          QuestionParserHelper.exampleOutput(questionText),
                        ),
                        ConstraintsSection(
                          descConstraints:
                          QuestionParserHelper.constraints(questionText),
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
                    sessionId: args.sessionId,
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