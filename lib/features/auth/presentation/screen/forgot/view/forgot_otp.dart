import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ArrowButton(),
              SizedBox(height: 50),
              Text("Enter OTP", style: AppStyle.font20BlackBold),
              SizedBox(height: 18),
              Text(
                "Please enter the OTP sent to your registered phone email: XXXXX@gmail.com",
                style: AppStyle.font16GrayRegular,
              ),
              SizedBox(height: 40),
              OtpFields(otpLength: 5),
              SizedBox(height: 33),
              Center(
                child: CustomButton(text: "verify", onPressed: () {}),
              ),
              SizedBox(height: 30),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Haven’t got the otp yet",
                      style: AppStyle.font16GrayRegular,
                    ),
                    Text("? Resend opt", style: AppStyle.font16BlackRegular),
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
