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
        body: LayoutBuilder(
          builder: (context, constraints) {
            final isWeb = constraints.maxWidth > 800;

            return Center(
              child: SingleChildScrollView(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 420),
                  padding: EdgeInsets.symmetric(
                    horizontal: isWeb ? 24 : 22.w,
                    vertical: isWeb ? 32 : 24.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ArrowButton(),

                      SizedBox(height: isWeb ? 40 : 50.h),

                      Text(
                        "Forgot password",
                        style: AppStyle.font20BlackSemiBold,
                      ),

                      SizedBox(height: isWeb ? 10 : 10.h),

                      Text(
                        "Please enter your User ID to reset the password",
                        style: AppStyle.font16GrayMediumSemiBold,
                      ),

                      SizedBox(height: isWeb ? 30 : 30.h),

                      Text("User ID", style: AppStyle.font16BlackMedium),

                      SizedBox(height: isWeb ? 12 : 12.h),

                      CustomTextField(
                        hint: "Enter your User ID",
                        prefixIcon: Icons.email_outlined,
                      ),

                      SizedBox(height: isWeb ? 30 : 30.h),

                      CustomButton(
                        text: "Reset Password",
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.forgotOtp);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
