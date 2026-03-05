import 'package:flutter/material.dart';
import 'package:mock_mate_ai/features/session/mcq_workspace/widget/build_option_selected.dart';

import '../../../../core/widget/custom_button.dart';
import '../../../../domain/entities/session/interview_session/interview_session_entity.dart';
import '../../session_layout.dart';
import '../../widget/question_sidebar.dart';

class McqWorkspace extends StatefulWidget {
  final int currentQuestion;
  final int totalQuestions;
  final int remainingSeconds;
  final List<SidebarQuestion> questions;
  final void Function(int) onQuestionSelected;
  final String questionText;
  final List<McqOptionEntity> options;
  final Map<int, int> selectedAnswers;
  final void Function(int q, int a) onAnswerSelected;
  final int? initialSelectedAnswer;
  final int sessionId;

  const McqWorkspace({
    super.key,
    required this.currentQuestion,
    required this.totalQuestions,
    required this.remainingSeconds,
    required this.questions,
    required this.onQuestionSelected,
    required this.questionText,
    required this.options,
    required this.initialSelectedAnswer,
    required this.onAnswerSelected,
    required this.selectedAnswers,
    required this.sessionId,
  });

  @override
  State<McqWorkspace> createState() => _McqWorkspaceState();
}

class _McqWorkspaceState extends State<McqWorkspace> {
  int? selectedAnswer;

  String get _formattedTime {
    final minutes = widget.remainingSeconds ~/ 60;
    final seconds = widget.remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    selectedAnswer = widget.initialSelectedAnswer;
  }

  @override
  Widget build(BuildContext context) {
    return SessionLayout(
      time: _formattedTime,
      currentQuestion: widget.currentQuestion,
      totalQuestions: widget.totalQuestions,
      remainingSeconds: widget.remainingSeconds,
      questions: widget.questions,
      onQuestionSelected: widget.onQuestionSelected,
      selectedAnswers: widget.selectedAnswers,
      onAnswerSelected: widget.onAnswerSelected,
      sessionId: widget.sessionId,
      body: Container(
        color: const Color(0xffF9FAFB),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.questionText,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.options.length,
                    itemBuilder: (context, index) {
                      final isSelected = selectedAnswer == index;
                      final optionText = widget.options[index].optionText;
                      return GestureDetector(
                        onTap: () {
                          setState(() => selectedAnswer = index);
                          widget.onAnswerSelected(
                            widget.currentQuestion,
                            index,
                          );
                        },
                        child: BuildOptionSelected(
                          isSelected: isSelected,
                          optionText: optionText,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: CustomButton(
                    onPressed: () {},
                    text: "Save Option",
                    widthBtn: 300,
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
