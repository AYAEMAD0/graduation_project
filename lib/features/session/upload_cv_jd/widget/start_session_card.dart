import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/di.dart';
import '../../../../core/widget/custom_dialog.dart';
import '../../../../core/widget/custom_toast.dart';
import '../../viewmodel/interview_session/ai_interview_cubit.dart';
import '../../viewmodel/interview_session/ai_interview_state.dart';
import '../../viewmodel/interview_session/interview_session_cubit.dart';
import '../../viewmodel/interview_session/interview_session_state.dart';
import '../viewmodel/upload_cv_cubit.dart';
import 'build_ui_start_session.dart';
import 'session_bloc_listeners.dart';


class StartSessionCard extends StatefulWidget {
  final String mode;
  const StartSessionCard({super.key, required this.mode});

  @override
  State<StartSessionCard> createState() => _StartSessionCardState();
}

class _StartSessionCardState extends State<StartSessionCard> {
  late final TextEditingController _jobDescriptionController;

  @override
  void initState() {
    super.initState();
    _jobDescriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _jobDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<UploadCvCubit>(),
      child: Builder(
        builder: (context) {
          return SessionBlocListeners(
            child: BlocBuilder<InterviewSessionCubit, InterviewSessionState>(
              builder: (context, dbState) {
                return BlocBuilder<AiInterviewCubit, AiInterviewState>(
                  builder: (context, aiState) {
                    return BuildUiStartSession(
                      isLoading: widget.mode == 'ai'
                          ? aiState is AiInterviewLoading
                          : dbState is InterviewSessionLoading,
                      controller: _jobDescriptionController,
                      mode: widget.mode,
                      onAnalyzePressed: () => _onAnalyzePressed(
                        context,
                        _jobDescriptionController,
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _onAnalyzePressed(
      BuildContext context,
      TextEditingController controller,
      ) {
    final cvState = context.read<UploadCvCubit>().state;
    if (!cvState.hasFile || cvState.selectedFile!.bytes == null) {
      CustomToast.showToast(message: "Please upload your CV first.", context: context);
      return;
    }
    if (controller.text
        .trim()
        .isEmpty) {
      CustomToast.showToast(message: "Please enter a job description.", context: context);
      return;
    }
    CustomDialog.showGenerating(context: context);
    if (widget.mode == 'ai') {
      context.read<AiInterviewCubit>().startAiInterview(
        cvBytes: cvState.selectedFile!.bytes!,
        cvFileName: cvState.selectedFile!.name,
        jobDescription: controller.text.trim(),
      );
    } else {
      context.read<InterviewSessionCubit>().startInterview(
        cvBytes: cvState.selectedFile!.bytes!,
        cvFileName: cvState.selectedFile!.name,
        jobDescription: controller.text.trim(),
      );
    }
  }
}