import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/core/widget/AppBackButton.dart';
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
              AppBackButton(),
              SizedBox(height: 50.h),
              Text("Forgot password", style: AppStyle.font20BlackSemiBold),
              SizedBox(height: 10.h),
              Text(
                "Please enter your User ID to reset the password",
                style: AppStyle.font16GrayMediumSemiBold,
              ),
              SizedBox(height: 30.h),
              Text("User ID", style: AppStyle.font16BlackMedium),
              SizedBox(height: 12.h),
              CustomTextField(
                hint: "Enter your User ID",
                prefixIcon: Icons.email_outlined,
              ),
              SizedBox(height: 30.h),
              Align(
                alignment: Alignment.center,
                child: CustomButton(
                  text: "Reset Password",
                  onPressed: () {
                    //logic reset password
                    Navigator.pushNamed(context, AppRoutes.forgotOtp);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
