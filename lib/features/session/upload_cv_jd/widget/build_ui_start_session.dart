import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../core/theme/app_color.dart';
import 'build_available_tracks.dart';
import 'build_btn_upload_cv.dart';
import 'build_upload_cv_section.dart';
import 'job_description_field.dart';
import 'session_card_header.dart';

class BuildUiStartSession extends StatelessWidget {
  const BuildUiStartSession({
    super.key,
    required this.isLoading,
    required this.mode,
    required this.controller,
    required this.onAnalyzePressed,
  });

  final bool isLoading;
  final String mode;
  final TextEditingController controller;
  final void Function() onAnalyzePressed;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

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
            if (mode != 'ai') BuildAvailableTracks(),
            const BuildUploadCvSection(),
            SizedBox(height: 20),
            JobDescriptionField(isMobile: isMobile, controller: controller),
            SizedBox(height: 20),
            BuildBtnUploadCv(
              isLoading: isLoading,
              onAnalyzePressed: onAnalyzePressed,
            ),
          ],
        ),
      ),
    );
  }
}
