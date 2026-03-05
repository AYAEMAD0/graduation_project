import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:responsive_framework/responsive_framework.dart';

class QuestionHeader extends StatelessWidget {
  final String time;
  final int currentQuestion;
  final int totalQuestions;

  const QuestionHeader({
    required this.time,
    required this.currentQuestion,
    required this.totalQuestions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("QUESTIONS", style: AppStyle.font18BlackSemiBold),
                const SizedBox(height: 16),
                _timerWidget(),
                const SizedBox(height: 16),
                _progressWidget(isMobile),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("QUESTIONS", style: AppStyle.font18BlackSemiBold),
                Row(
                  children: [
                    _timerWidget(),
                    const SizedBox(width: 24),
                    _progressWidget(isMobile),
                  ],
                ),
              ],
            ),
    );
  }

  Widget _timerWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.access_time,
            size: 16,
            color: AppColor.primaryPurpleColor,
          ),
          const SizedBox(width: 8),
          Text(time, style: AppStyle.font16BlackMedium),
        ],
      ),
    );
  }

  Widget _progressWidget(bool isMobile) {
    return SizedBox(
      width: isMobile ? double.infinity : null,
      child: Column(
        crossAxisAlignment: isMobile
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          Text(
            "Q$currentQuestion OF $totalQuestions",
            style: AppStyle.font16GrayMediumSemiBold,
          ),

          //todo remove dots question
          // const SizedBox(height: 8),
          //
          // Wrap(
          //   spacing: 8,
          //   runSpacing: 8,
          //   children: List.generate(
          //     totalQuestions,
          //     (index) => Container(
          //       width: 7,
          //       height: 7,
          //       decoration: BoxDecoration(
          //         shape: BoxShape.circle,
          //         color: index < currentQuestion
          //             ? AppColor.primaryPurpleColor
          //             : AppColor.grayLightColor,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
