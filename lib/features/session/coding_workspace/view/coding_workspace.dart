import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_mate_ai/core/config/di.dart';
import 'package:mock_mate_ai/core/routes/app_routes.dart';
import 'package:mock_mate_ai/features/session/widget/question_sidebar.dart';

import '../../../../domain/entities/session/interview_session/interview_session_entity.dart';
import '../../model/session_arguments.dart';
import '../../session_layout.dart';
import '../viewmodel/code_editor/code_editor_cubit.dart';
import '../viewmodel/run_code/run_code_cubit.dart';
import '../viewmodel/submit_code/submit_code_cubit.dart';
import '../widget/code_editor_panel.dart';
import '../widget/question_panel.dart';
import '../widget/resizable_panel.dart';

class CodingWorkspace extends StatelessWidget {
  final SessionArguments args;
  final String questionTitle;
  final String questionText;
  final List<TestCaseEntity> testCases;
  final List<CodeTemplateEntity> templates;
  final int questionId;
  final Map<int, String> savedCode;
  final int? savedLanguageId;
  final void Function(int langId, String code) onCodeChanged;
  final void Function(int langId, String code) onCodeSaved;
  final void Function(int langId) onCodeReverted;

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
    required this.onCodeSaved,
    required this.onCodeReverted,
    this.savedLanguageId,
  });

  @override
  Widget build(BuildContext context) {
    void goToNextQuestion(BuildContext context) {
      final nextIndex = args.currentQuestion + 1;

      if (nextIndex > args.totalQuestions) {
        args.onQuestionSelected(0);
        Navigator.popUntil(
          context,
          ModalRoute.withName(AppRoutes.questionOverview),
        );
        return;
      }

      final question = args.questions.firstWhere(
        (q) => q.index == nextIndex,
        orElse: () => SidebarQuestion(index: nextIndex, type: ''),
      );

      final sessionArgs = args.copyWith(currentQuestion: nextIndex);
      args.onQuestionSelected(nextIndex);

      final baseArgs = {
        'sessionArgs': sessionArgs,
        'savedCode': question.savedCode,
        'savedLanguageId': question.savedLanguageId,
        'onCodeChanged': (int langId, String code) {
          question.tempCode[langId] = code;
          question.tempLanguageId = langId;
        },
        'onCodeSaved': (int langId, String code) {
          question.savedCode[langId] = code;
          question.savedLanguageId = langId;
          question.tempCode.clear();
          question.tempLanguageId = null;
          args.onCodeSaved(question.questionId);
        },
        'onCodeReverted': (int langId) {
          question.tempCode.remove(langId);
        },
      };

      if (question.type == "Coding") {
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.codeWorkspace,
          arguments: {
            ...baseArgs,
            'questionId': question.questionId,
            'questionTitle': question.questionTitle,
            'questionText': question.questionText,
            'testCases': question.testCases,
            'templates': question.templates,
          },
        );
      } else {
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.mcqWorkspace,
          arguments: {
            ...baseArgs,
            'questionId': question.questionId,
            'questionText': question.questionText,
            'options': question.options,
          },
        );
      }
    }

    return StreamBuilder<int>(
      stream: args.timerStream,
      initialData: args.remainingSeconds,
      builder: (context, snapshot) {
        final seconds = snapshot.data ?? args.remainingSeconds;
        final minutes = seconds ~/ 60;
        final secs = seconds % 60;
        final time =
            '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';

        return SessionLayout(
          time: time,
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
                child: ResizablePanel(
                  axis: Axis.horizontal,
                  initialFraction: 0.25,
                  minFraction: 0.15,
                  maxFraction: 0.50,
                  first: QuestionPanel(
                    questionNumber: args.currentQuestion,
                    questionTitle: questionTitle,
                    questionText: questionText,
                    testCases: testCases,
                  ),
                  second: CodeEditor(
                    templates: templates,
                    testCases: testCases,
                    sessionId: args.sessionId,
                    questionId: questionId,
                    savedCode: savedCode,
                    savedLanguageId: savedLanguageId,
                    onCodeChanged: onCodeChanged,
                    onCodeSaved: onCodeSaved,
                    onCodeReverted: onCodeReverted,
                    savedCodeQuestions: args.savedCodeQuestions,
                    onSubmit: () => goToNextQuestion(context),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
