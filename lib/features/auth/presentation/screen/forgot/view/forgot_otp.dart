import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/core/widget/arrow_button.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';
import 'package:mock_mate_ai/features/auth/presentation/widget/otp_fields.dart';
import '../../../../../../core/routes/app_routes.dart';

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
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 50.h),
                    Text("Enter OTP", style: AppStyle.font40BlackSemiBold),
                    SizedBox(height: 60.h),
                    RichText(
                      text: TextSpan(
                        text:
                            "Please enter the OTP sent to your registered phone \nemail: ",
                        style: AppStyle.font25GrayMediumSemiBold,
                        children: [
                          TextSpan(
                            text: "XXXXX@gmail.com",
                            style: AppStyle.font20BlackSemiBold,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 60.h),
                    SizedBox(
                        width: 700.w,
                        child: OtpFields(otpLength: 5),
                    ),
                    SizedBox(height: 80.h),
                    CustomButton(
                      text: "verify",
                      onPressed: () {
                        //logic verify
                        Navigator.pushNamed(context, AppRoutes.resetPassword);
                      },
                    ),
                    SizedBox(height: 80.h),
                    Row(
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
