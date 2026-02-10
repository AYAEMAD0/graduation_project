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
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWeb = constraints.maxWidth > 800;

          return Center(
            child: SingleChildScrollView(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 420),
                padding: EdgeInsets.symmetric(horizontal: isWeb ? 24 : 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: isWeb ? 40 : 40.h),
                    Center(
                      child: Image.asset(
                        AppAsset.logoAppImage,
                        width: isWeb ? 140 : 336.w,
                        height: isWeb ? 140 : 245.h,
                      ),
                    ),

                    SizedBox(height: isWeb ? 20 : 20.h),

                    Text(
                      "Welcome back!",
                      style: AppStyle.font24BlackBold,
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: isWeb ? 30 : 30.h),

                    CustomTextField(
                      hint: "Email",
                      prefixIcon: Icons.email_outlined,
                    ),

                    SizedBox(height: isWeb ? 20 : 30.h),

                    CustomTextField(
                      hint: "Password",
                      prefixIcon: Icons.lock_outline,
                      obscure: true,
                    ),

                    SizedBox(height: isWeb ? 12 : 20.h),

                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.forgotPassword,
                          );
                        },
                        child: Text(
                          "Forgot Password?",
                          style: AppStyle.font14GrayMedium,
                        ),
                      ),
                    ),

                    SizedBox(height: isWeb ? 24 : 50.h),

                    CustomButton(text: "LOG IN", onPressed: () {}),

                    SizedBox(height: isWeb ? 20 : 20.h),

                    Text(
                      " Or sign up using ",
                      style: AppStyle.font15GrayDarkRegular,
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: isWeb ? 20 : 20.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialButton(icon: AppAsset.facebookIcon, onTap: () {}),
                        SizedBox(width: isWeb ? 16 : 20.w),
                        SocialButton(icon: AppAsset.googleIcon, onTap: () {}),
                      ],
                    ),

                    SizedBox(height: isWeb ? 40 : 180.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account?",
                          style: AppStyle.font16GrayRegular,
                        ),
                        SizedBox(width: 4),
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
              ),
            ),
          );
        },
      ),
    );
  }
}
