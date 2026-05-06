import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_mate_ai/core/config/di.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/widget/custom_toast.dart';
import 'package:mock_mate_ai/features/session/viewmodel/interview_session/ai_interview_cubit.dart';
import 'package:mock_mate_ai/features/session/viewmodel/interview_session/ai_interview_state.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/widget/custom_dialog.dart';

import '../../viewmodel/interview_session/interview_session_cubit.dart';
import '../../viewmodel/interview_session/interview_session_state.dart';
import '../viewmodel/upload_cv_cubit.dart';
import 'build_btn_upload_cv.dart';
import 'build_upload_cv_section.dart';
import 'job_description_field.dart';
import 'session_card_header.dart';

class StartSessionCard extends StatelessWidget {
  final String mode; // 'ai' or 'db'

  const StartSessionCard({super.key, required this.mode});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final jobDescriptionController = TextEditingController();

    return BlocProvider(
      create: (_) => getIt<UploadCvCubit>(),
      child: Builder(
        builder: (context) {
          return MultiBlocListener(
            listeners: [
              BlocListener<InterviewSessionCubit, InterviewSessionState>(
                listener: (context, state) {
                  if (state is InterviewSessionError) {
                    CustomDialog.hideLoading(context: context);
                    CustomToast.showToast(message: state.message, context: context);
                  }
                  if (state is InterviewSessionSuccess) {
                    CustomDialog.hideLoading(context: context);
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.questionOverview,
                      arguments: {'interviewSession': state.interviewSession},
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
            child: _buildUI(context, isMobile, jobDescriptionController),
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

            bool isLoading = (mode == 'ai')
                ? aiState is AiInterviewLoading
                : dbState is InterviewSessionLoading;

            return Center(
              child: Container(
                width: isMobile ? double.infinity : 1010,
                padding: EdgeInsets.all(isMobile ? 28 : 40),
                margin: EdgeInsets.symmetric(horizontal: isMobile ? 15 : 20),
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
                    SizedBox(height: isMobile ? 25 : 40),
                    const BuildUploadCvSection(),
                    SizedBox(height: isMobile ? 25 : 45),
                    JobDescriptionField(
                      isMobile: isMobile,
                      controller: controller,
                    ),
                    SizedBox(height: isMobile ? 25 : 50),
                    BuildBtnUploadCv(
                      isLoading: (mode == 'ai')
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

    if (mode == 'ai') {
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