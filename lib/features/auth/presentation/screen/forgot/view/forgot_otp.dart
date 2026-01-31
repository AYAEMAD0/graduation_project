import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/core/widget/arrow_button.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';
import 'package:mock_mate_ai/features/verfiy_screen/widget/otp_fields.dart';

class ForgotOtp extends StatelessWidget {
  const ForgotOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.0.w, vertical: 24.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ArrowButton(),
              SizedBox(height: 50.h),
              Text("Enter OTP", style: AppStyle.font20BlackSemiBold),
              SizedBox(height: 18.h),
              RichText(
                text: TextSpan(
                  text:
                      "Please enter the OTP sent to your registered phone \nemail: ",
                  style: AppStyle.font16GrayMediumSemiBold,
                  children: [
                    TextSpan(
                      text: "XXXXX@gmail.com",
                      style: AppStyle.font16BlackSemiBold,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40.h),
              OtpFields(otpLength: 5),
              SizedBox(height: 33.h),
              Center(
                child: CustomButton(text: "verify", onPressed: () {}),
              ),
              SizedBox(height: 30.h),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Haven’t got the otp yet? ",
                      style: AppStyle.font16GrayMediumSemiBold,
                    ),
                    GestureDetector(
                      onTap: () {
                        // resend otp logic
                      },
                      child: Text(
                        "Resend Otp",
                        style: AppStyle.font16BlackSemiBold.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColor.blackColor,
                          decorationThickness: 1.57,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
