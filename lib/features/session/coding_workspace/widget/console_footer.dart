import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_style.dart';
import '../../../../core/widget/custom_button.dart';
import '../viewmodel/run_code/run_code_cubit.dart';
import '../viewmodel/run_code/run_code_state.dart';
import '../viewmodel/submit_code/submit_code_cubit.dart';

class ConsoleFooter extends StatelessWidget {
  final bool showConsole;
  final VoidCallback onToggleConsole;
  final VoidCallback onRunCode;
  final VoidCallback onSaveCode;

  const ConsoleFooter({
    super.key,
    required this.showConsole,
    required this.onToggleConsole,
    required this.onRunCode,
    required this.onSaveCode,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RunCodeCubit, RunCodeState>(
      builder: (context, runState) {
        return BlocBuilder<SubmitCodeCubit, SubmitCodeState>(
          builder: (context, submitState) {
            final isRunning = runState is RunCodeLoading;
            final isSaving = submitState is SubmitCodeLoading;
            final isSaved = submitState is SubmitCodeSuccess;

            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: const BoxDecoration(
                color: Color(0xFF0E141E),
                border: Border(top: BorderSide(color: Colors.white10)),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: onToggleConsole,
                    child: Row(
                      children: [
                        Icon(
                          showConsole
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_up,
                          color: Colors.white54,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "Console",
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      CustomButton(
                        onPressed: isRunning ? null : onRunCode,
                        widthBtn: 170,
                        child: isRunning
                            ? const Center(
                                child: SizedBox(
                                  height: 18,
                                  width: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : Center(
                                child: Text(
                                  "Run Code",
                                  style: AppStyle.font18WhiteBold,
                                ),
                              ),
                      ),
                      const SizedBox(width: 12),
                      CustomButton(
                        onPressed: isSaving || isSaved ? null : onSaveCode,
                        widthBtn: 170,
                        child: isSaving
                            ? const Center(
                                child: SizedBox(
                                  height: 18,
                                  width: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : isSaved
                            ? const Center(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.check_circle_outline,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      "Saved!",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Center(
                                child: Text(
                                  "Save Code",
                                  style: AppStyle.font18WhiteBold,
                                ),
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}