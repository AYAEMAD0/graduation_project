import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_mate_ai/core/constants/app_asset.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';
import 'package:mock_mate_ai/core/widget/custom_text_field.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../widget/social_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40.h),
            Column(
              children: [
                Image.asset(AppAsset.logoAppImage, width: 188.w, height: 144.h),
                SizedBox(height: 20.h),
                Text("Welcome back!", style: AppStyle.font24BlackBold),
                SizedBox(height: 30.h),
                CustomTextField(hint: "Email",prefixIcon: Icons.email_outlined,),
                SizedBox(height: 30.h),
                CustomTextField(hint: "Password",prefixIcon: Icons.lock_outline,obscure: true,),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot Password?",
                      style: AppStyle.font14GrayMedium,
                    ),
                  ),
                ),
                SizedBox(height: 50.h),
                CustomButton(
                  text: "LOG IN",
                  onPressed: () {
                    // Handle login button press
                  },
                ),
                SizedBox(height: 20.h),
                Text(
                  " Or sign up using ",
                  style: AppStyle.font15GrayDarkRegular,
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(
                      icon: AppAsset.facebookIcon,
                      onTap: () {
                        //  Facebook login
                      },
                    ),
                    SizedBox(width: 20.w),
                    SocialButton(
                      icon: AppAsset.googleIcon,
                      onTap: () {
                        // Google login
                      },
                    ),
                  ],
                ),
                SizedBox(height: 180.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account?",
                      style: AppStyle.font16GrayRegular,
                    ),
                    SizedBox(width: 3.w),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.signup,
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: AppStyle.font16BlackBold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
