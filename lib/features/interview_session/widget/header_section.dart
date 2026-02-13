import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../core/theme/app_color.dart';
import 'progress_bar.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
    required this.currentIndex,
    required this.lengthQuestion,
    required this.endTime,
  });

  final int currentIndex;
  final int lengthQuestion;
  final int endTime;
  @override
  Widget build(BuildContext context) {
    final breakpoints = ResponsiveBreakpoints.of(context);
    final isMobile = breakpoints.isMobile;
    double progress = (currentIndex + 1) / lengthQuestion;

    return Column(
      children: [
        SizedBox(height: isMobile ? 45 : 60),
        Text(
          "Interview Session",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            Text(
              "Question ${currentIndex + 1}/$lengthQuestion",
              style: TextStyle(
                fontSize: isMobile ? 18 : 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                const Icon(Icons.timer_outlined),
                const SizedBox(width: 8),
                CountdownTimer(
                  endTime: endTime,
                  widgetBuilder: (_, time) {
                    if (time == null) {
                      return const Text("00:00");
                    }
                    final minutes = (time.min ?? 0).toString().padLeft(2, '0');
                    final seconds = (time.sec ?? 0).toString().padLeft(2, '0');

                    return Text(
                      "$minutes:$seconds",
                      style: TextStyle(
                        fontSize: isMobile ? 18 : 24,
                        color: (time.min == 0 && (time.sec ?? 0) <= 10)
                            ? AppColor.red
                            : AppColor.blackColor,
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 15),

        /// Progress Bar
        ProgressBar(progress: progress),
        const SizedBox(height: 40),
      ],
    );
  }
}
