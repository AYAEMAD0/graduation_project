import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_style.dart';
import '../../../../core/widget/custom_button.dart';
import '../../viewmodel/interview_session/interview_session_state.dart';

class BuildBtnUploadCv extends StatelessWidget {
  const BuildBtnUploadCv({
    super.key,
    required this.onAnalyzePressed,
    required this.state,
    required this.isLoading,
  });

  final void Function() onAnalyzePressed;
  final InterviewSessionState state;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isSuccess = state is InterviewSessionSuccess;

    return Center(
      child: CustomButton(
        height: isMobile ? 56 : 75,
        hasShadow: true,
        colorBackGround: isSuccess ? AppColor.grayLightColor : null,
        onPressed: isLoading || isSuccess ? null : onAnalyzePressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: isMobile ? 8 : 15,
          children: [
            if (isSuccess)
              Icon(
                Icons.check_circle,
                color: AppColor.whiteColor,
                size: isMobile ? 20 : 28,
              ),
            Flexible(
              child: Text(
                "Analyze Match",
                overflow: TextOverflow.ellipsis,
                style: AppStyle.font18WhiteBold.copyWith(
                  fontSize: isMobile ? 18 : 30,
                ),
              ),
            ),
            if (!isSuccess)
              Icon(
                Icons.arrow_forward,
                color: AppColor.whiteColor,
                size: isMobile ? 20 : 30,
              ),
          ],
        ),
      ),
    );
  }
}