import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/core/widget/arrow_button.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';
import 'package:mock_mate_ai/core/widget/custom_text_field.dart';
import '../../../../../../core/routes/app_routes.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
                    Text("Forgot password", style: AppStyle.font40BlackSemiBold),
                    SizedBox(height: 50.h),
                    Text(
                      "Please enter your User ID to reset the password",
                      style: AppStyle.font25GrayMediumSemiBold,
                    ),
                    SizedBox(height: 50.h),
                    SizedBox(
                      width: 700.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("User ID", style: AppStyle.font20BlackSemiBold),
                          SizedBox(height: 15.h),
                          CustomTextField(
                            hint: "Enter your User ID",
                            prefixIcon: Icons.email_outlined,
                          ),
                          SizedBox(height: 80.h),
                        ],
                      ),
                    ),
                    CustomButton(
                      text: "Reset Password",
                      onPressed: () {
                        //logic reset password
                        Navigator.pushNamed(context, AppRoutes.forgotOtp);
                      },
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