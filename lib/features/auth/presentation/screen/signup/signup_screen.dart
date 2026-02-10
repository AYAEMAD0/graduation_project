import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_mate_ai/core/constants/app_asset.dart';
import 'package:mock_mate_ai/core/routes/app_routes.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';
import 'package:mock_mate_ai/core/widget/custom_text_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Center(
          child: SizedBox(
            width: 900.w,
            child: Column(
              children: [
                Image.asset(AppAsset.logoAppImage, width: 188.w, height: 144.h),
                SizedBox(height: 10.h),
                Text("Let’s Get Started!", style: AppStyle.font24BlackBold),
                SizedBox(height: 30.h),
                CustomTextField(
                  hint: "First Name",
                  prefixIcon: Icons.person_outline_sharp,
                ),
                SizedBox(height: 30.h),
                CustomTextField(
                  hint: "Last Name",
                  prefixIcon: Icons.person_outline_sharp,
                ),
                SizedBox(height: 30.h),
                CustomTextField(
                  hint: "Email",
                  prefixIcon: Icons.email_outlined,
                ),
                SizedBox(height: 30.h),
                CustomTextField(
                  hint: "Password",
                  prefixIcon: Icons.lock_outline,
                  obscure: true,
                ),
                SizedBox(height: 30.h),
                CustomTextField(
                  hint: "Confirm Password",
                  prefixIcon: Icons.lock_outline,
                  obscure: true,
                ),
                SizedBox(height: 30.h),
                CustomButton(
                  text: "CREATE",
                  onPressed: () {
                    // Handle create button press
                    Navigator.pushNamed(context, AppRoutes.verify);
                  },
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: AppStyle.font16GrayRegular,
                    ),
                    SizedBox(width: 3.w),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.login,
                        );
                      },
                      child: Text(
                        "Login here",
                        style: AppStyle.font16BlackBold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
