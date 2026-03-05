import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/routes/app_routes.dart';
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
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: isMobile ? 12 : 20,
        children: [
          CustomButton(
            height: isMobile ? 56 : 75,
            hasShadow: true,
            colorBackGround: state is InterviewSessionSuccess
                ? AppColor.grayLightColor
                : null,
            onPressed: isLoading || state is InterviewSessionSuccess
                ? null
                : onAnalyzePressed,
            child: isLoading
                ? Center(
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: const CircularProgressIndicator(
                        color: AppColor.whiteColor,
                        strokeWidth: 2.5,
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    spacing: isMobile ? 8 : 15,
                    children: [
                      if (state is InterviewSessionSuccess)
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
                      if (state is! InterviewSessionSuccess)
                        Icon(
                          Icons.arrow_forward,
                          color: AppColor.whiteColor,
                          size: isMobile ? 20 : 30,
                        ),
                    ],
                  ),
          ),
          if (state is InterviewSessionSuccess)
            CustomButton(
              height: isMobile ? 56 : 75,
              hasShadow: true,
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  AppRoutes.questionOverview,
                  arguments: {
                    'interviewSession':
                        (state as InterviewSessionSuccess).interviewSession,
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                spacing: isMobile ? 8 : 15,
                children: [
                  Flexible(
                    child: Text(
                      "Start Interview",
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle.font18WhiteBold.copyWith(
                        fontSize: isMobile ? 18 : 30,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: AppColor.whiteColor,
                    size: isMobile ? 20 : 30,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
