import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/core/widget/arrow_button.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';
import 'package:mock_mate_ai/features/verfiy_screen/widget/otp_fields.dart';
import 'package:mock_mate_ai/features/verfiy_screen/widget/resend_code_timer.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ArrowButton(),
              SizedBox(height: 50.h),
              Text("Verification Code", style: AppStyle.font32BlackBold),
              SizedBox(height: 70.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    Text(
                      "Enter the 6-digit code we sent to your email",
                      style: AppStyle.font17BlackRegular,
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 22.h),

                    const OtpFields(),

                    SizedBox(height: 22.h),

                    const ResendCodeTimer(),

                    SizedBox(height: 40.h),

                    SizedBox(
                      width: 0.6.sw,
                      child: CustomButton(text: 'Verify', onPressed: () {}),
                    ),
                  ],
                ),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
