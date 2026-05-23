import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_mate_ai/core/cache/interview_cache_service.dart';
import 'package:mock_mate_ai/core/config/di.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/widget/custom_toast.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/widget/custom_dialog.dart';
import '../../viewmodel/interview_session/ai_interview_cubit.dart';
import '../../viewmodel/interview_session/ai_interview_state.dart';
import '../../viewmodel/interview_session/interview_session_cubit.dart';
import '../../viewmodel/interview_session/interview_session_state.dart';
import '../viewmodel/upload_cv_cubit.dart';
import 'build_available_tracks.dart';
import 'build_btn_upload_cv.dart';
import 'build_upload_cv_section.dart';
import 'job_description_field.dart';
import 'session_card_header.dart';

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
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

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
                          ? aiState is AiInterviewLoading
                          : dbState is InterviewSessionLoading,

                      onAnalyzePressed: () => _onAnalyzePressed(
                        context,
                        controller,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _onAnalyzePressed(
      BuildContext context,
      TextEditingController jobDescriptionController,
      ) {
    final cvState = context.read<UploadCvCubit>().state;
    if (!cvState.hasFile || cvState.selectedFile!.bytes == null) {
      CustomToast.showToast(message: "Please upload your CV first.", context: context);
      return;
    }
    if (jobDescriptionController.text.trim().isEmpty) {
      CustomToast.showToast(message: "Please enter a job description.", context: context);
      return;
    }
    CustomDialog.showGenerating(context: context);
    if (widget.mode == 'ai') {
      context.read<AiInterviewCubit>().startAiInterview(
        cvBytes: cvState.selectedFile!.bytes!,
        cvFileName: cvState.selectedFile!.name,
        jobDescription: jobDescriptionController.text.trim(),
      );
    } else {
      context.read<InterviewSessionCubit>().startInterview(
        cvBytes: cvState.selectedFile!.bytes!,
        cvFileName: cvState.selectedFile!.name,
        jobDescription: jobDescriptionController.text.trim(),
      );
    }
  }
}