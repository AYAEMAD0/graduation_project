import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';

class ResendCodeTimer extends StatefulWidget {
  const ResendCodeTimer({super.key});

  @override
  State<ResendCodeTimer> createState() => _ResendCodeTimerState();
}

class _ResendCodeTimerState extends State<ResendCodeTimer> {
  int seconds = 45;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    timer?.cancel();
    seconds = 45;
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (seconds == 0) {
        t.cancel();
      } else {
        setState(() {
          seconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: seconds == 0
          ? () {
              _startTimer();
            }
          : null,
      child: Text(
        seconds == 0
            ? "Resend code"
            : "Resend code in 00:${seconds.toString().padLeft(2, '0')}",
        style: AppStyle.font16BlackRegular.copyWith(
          color: seconds == 0 ? AppColor.primaryBlueColor : Colors.black,
          fontSize: 16.45,
        ),
      ),
    );
  }
}
