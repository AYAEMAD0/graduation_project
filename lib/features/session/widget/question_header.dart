import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../core/widget/custom_dialog.dart';
import '../model/session_arguments.dart';
import '../question_overview/viewmodel/question_overview_cubit.dart';

class QuestionHeader extends StatefulWidget {
  final String time;
  final int currentQuestion;
  final int totalQuestions;
  final SessionArguments args;
  final VoidCallback? onTimeUp;

  const QuestionHeader({
    super.key,
    required this.time,
    required this.currentQuestion,
    required this.totalQuestions,
    required this.args,
    this.onTimeUp,
  });

  @override
  State<QuestionHeader> createState() => _QuestionHeaderState();
}

class _QuestionHeaderState extends State<QuestionHeader> {
  bool _dialogShown = false;

  void _onTimeUp() {
    if (_dialogShown) return;
    _dialogShown = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      CustomDialog.showTimeExpired(
        context: context,
        onSubmit: () => widget.onTimeUp?.call(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return StreamBuilder<int>(
      stream: widget.args.timerStream,
      initialData: widget.args.remainingSeconds,
      builder: (context, snapshot) {
        final seconds = snapshot.data ?? widget.args.remainingSeconds;

        if (seconds <= 0) _onTimeUp();

        final timeText = QuestionOverviewCubit.formatTime(seconds);
        final isLow = seconds <= 60;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("QUESTIONS", style: AppStyle.font18BlackSemiBold),
                    const SizedBox(height: 16),
                    _timerWidget(timeText, isLow),
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
                        _timerWidget(timeText, isLow),
                        const SizedBox(width: 24),
                        _progressWidget(isMobile),
                      ],
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget _timerWidget(String timeText, bool isLow) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.access_time,
            size: 16,
            color: isLow ? Colors.red : AppColor.primaryPurpleColor,
          ),
          const SizedBox(width: 8),
          Text(
            timeText,
            style: AppStyle.font16BlackMedium.copyWith(
              color: isLow ? Colors.red : null,
            ),
          ),
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
            "Q${widget.currentQuestion} OF ${widget.totalQuestions}",
            style: AppStyle.font16GrayMediumSemiBold,
          ),
        ],
      ),
    );
  }
}
