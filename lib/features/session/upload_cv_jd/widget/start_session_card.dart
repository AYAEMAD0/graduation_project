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
          return MultiBlocListener(
            listeners: [
              BlocListener<InterviewSessionCubit,
                  InterviewSessionState>(

                listener: (context, state) async {
                  if (state is InterviewSessionError) {
                    CustomDialog.hideLoading(
                      context: context,
                    );

                    CustomToast.showToast(
                      message: state.message,
                      context: context,
                    );
                  }

                  if (state is InterviewSessionSuccess) {
                    CustomDialog.hideLoading(
                      context: context,
                    );

                    await InterviewCacheService
                        .saveSession(
                      state.interviewSession
                          .toJson(),
                    );
                    if (!context.mounted) return;
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.questionOverview,
                      arguments: {
                        'interviewSession':
                        state.interviewSession,
                      },
                    );
                  }
                },
              ),

              BlocListener<AiInterviewCubit,
                  AiInterviewState>(

                listener: (context, state) async {
                  if (state is AiInterviewError) {
                    CustomDialog.hideLoading(
                      context: context,
                    );

                    CustomToast.showToast(
                      message: state.message,
                      context: context,
                    );
                  }

                  if (state is AiInterviewSuccess) {
                    CustomDialog.hideLoading(
                      context: context,
                    );

                    await InterviewCacheService
                        .saveSession(
                      state.interviewSession
                          .toJson(),
                    );
                    if (!context.mounted) return;
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.questionOverview,
                      arguments: {
                        'interviewSession':
                        state.interviewSession,
                      },
                    );
                  }
                },
              ),
              BlocListener<AiInterviewCubit, AiInterviewState>(
                listener: (context, state) {
                  if (state is AiInterviewError) {
                    CustomDialog.hideLoading(context: context);
                    CustomToast.showToast(message: state.message, context: context);
                  }
                  if (state is AiInterviewSuccess) {
                    CustomDialog.hideLoading(context: context);
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.questionOverview,
                      arguments: {'interviewSession': state.interviewSession},
                    );
                  }
                },
              ),
            ],
            child: _buildUI(context, isMobile, _jobDescriptionController),
          );
        },
      ),
    );
  }

  Widget _buildUI(BuildContext context, bool isMobile, TextEditingController controller) {
    return BlocBuilder<InterviewSessionCubit, InterviewSessionState>(
      builder: (context, dbState) {
        return BlocBuilder<AiInterviewCubit, AiInterviewState>(
          builder: (context, aiState) {

            return Center(
              child: Container(
                width: isMobile ? double.infinity : 1010,
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 18),
                decoration: BoxDecoration(
                  color: AppColor.whiteDarkColor,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.blackColor.withValues(alpha: 0.2),
                      blurRadius: 60,
                      offset: const Offset(0, 25),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SessionCardHeader(isMobile: isMobile),
                    SizedBox(height: 15),
                    if (widget.mode != 'ai') BuildAvailableTracks(),
                    const BuildUploadCvSection(),
                    SizedBox(height: 20),
                    JobDescriptionField(
                      isMobile: isMobile,
                      controller: controller,
                    ),
                    SizedBox(height: 20),
                    BuildBtnUploadCv(
                      isLoading: (widget.mode == 'ai')
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