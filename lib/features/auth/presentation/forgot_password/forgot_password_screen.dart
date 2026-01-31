import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/core/widget/AppBackButton.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';
import 'package:mock_mate_ai/core/widget/custom_text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),

              AppBackButton(),
              
              SizedBox(height: 50.h,),
              
              Text("Forgot password",style: AppStyle.font24BlackBold,),
              
              SizedBox(height: 10.h,),
              
              Text("Please enter your User ID to reset the password",style: AppStyle.font16GrayRegular,),

              SizedBox(height: 20.h,),
              
              CustomTextField(hint: "Enter your User ID",
                label: "User ID",),

              SizedBox(height: 30.h,),

              Align(
                alignment: Alignment.center,
                child: CustomButton(
                  text: "Reset Password",
                  onPressed: () {},
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
