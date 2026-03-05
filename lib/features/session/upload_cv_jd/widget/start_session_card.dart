import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/core/widget/custom_text_field.dart';
import 'package:mock_mate_ai/core/widget/custom_toast.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../viewmodel/interview_session/interview_session_cubit.dart';
import '../../viewmodel/interview_session/interview_session_state.dart';
import 'build_btn_upload_cv.dart';
import 'build_upload_cv_section.dart';

class StartSessionCard extends StatefulWidget {
  const StartSessionCard({super.key});

  @override
  State<StartSessionCard> createState() => _StartSessionCardState();
}

class _StartSessionCardState extends State<StartSessionCard> {
  final TextEditingController _jobDescriptionController =
      TextEditingController();
  PlatformFile? _selectedFile;

  @override
  void dispose() {
    _jobDescriptionController.dispose();
    super.dispose();
  }

  void _onFileSelected(PlatformFile? file) {
    setState(() => _selectedFile = file);
  }

  void onAnalyzePressed() {
    if (_selectedFile == null || _selectedFile!.bytes == null) {
      CustomToast.showToast(
        message: "Please upload your CV first.",
        context: context,
      );
      return;
    }
    if (_jobDescriptionController.text.trim().isEmpty) {
      CustomToast.showToast(
        message: "Please enter a job description.'",
        context: context,
      );
      return;
    }
    context.read<InterviewSessionCubit>().startInterview(
      cvBytes: _selectedFile!.bytes!,
      cvFileName: _selectedFile!.name,
      jobDescription: _jobDescriptionController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return BlocConsumer<InterviewSessionCubit, InterviewSessionState>(
      listener: (context, state) {
        if (state is InterviewSessionError) {
          CustomToast.showToast(message: state.message, context: context);
        }
      },
      builder: (context, state) {
        final isLoading = state is InterviewSessionLoading;
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
                Row(
                  children: [
                    Icon(
                      Icons.rocket_launch,
                      size: isMobile ? 25 : 60,
                      color: AppColor.purple,
                    ),
                    SizedBox(width: isMobile ? 12 : 22),
                    Flexible(
                      child: Text(
                        "Start New Session",
                        overflow: TextOverflow.ellipsis,
                        style: isMobile
                            ? AppStyle.font20BlackSemiBold
                            : AppStyle.font24BlackBold.copyWith(fontSize: 40),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: isMobile ? 25 : 40),
                BuildUploadCvSection(onFileSelected: _onFileSelected),
                SizedBox(height: isMobile ? 25 : 45),
                Text(
                  "JOB DESCRIPTION",
                  style: isMobile
                      ? AppStyle.font18BlackSemiBold.copyWith(
                          color: const Color(0xff64748B),
                        )
                      : AppStyle.font24BlackBold.copyWith(
                          color: const Color(0xff64748B),
                        ),
                ),
                SizedBox(height: isMobile ? 12 : 20),
                CustomTextField(
                  controller: _jobDescriptionController,
                  hint: "Paste the job description here to analyze gaps...",
                  hintStyle: AppStyle.font14GrayRegular.copyWith(
                    fontSize: isMobile ? 14 : 22,
                  ),
                  maxLines: isMobile ? 3 : 5,
                  borderColor: const Color(0xffCBD5E1),
                  borderFocuseColor: AppColor.purple,
                  keyboard: TextInputType.multiline,
                ),
                SizedBox(height: isMobile ? 25 : 50),
                BuildBtnUploadCv(
                  isLoading: isLoading,
                  onAnalyzePressed: onAnalyzePressed,
                    state: state
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
