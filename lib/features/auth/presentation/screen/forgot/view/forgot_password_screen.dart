import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/core/widget/arrow_button.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';
import 'package:mock_mate_ai/core/widget/custom_text_field.dart';
import '../../../../../../core/routes/app_routes.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    final horizontalPadding = isMobile ? 22.0 : 60.0;
    final titleFontSize = isMobile ? 25.0 : 35.0;
    final subtitleFontSize = isMobile ? 16.0 : 23.0;
    final spacingSmall = isMobile ? 15.0 : 20.0;
    final spacingMedium = isMobile ? 30.0 : 50.0;
    final fieldWidth = isMobile ? double.infinity : 700.0;

    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: horizontalPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ArrowButton(),
                SizedBox(height: spacingSmall,),
                Expanded(
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "Forgot password",
                            style: AppStyle.font40BlackSemiBold
                                .copyWith(fontSize: titleFontSize),
                          ),
                          SizedBox(height: spacingSmall),
                          Text(
                            "Please enter your User ID to reset the password",
                            style: AppStyle.font25GrayMediumSemiBold
                                .copyWith(fontSize: subtitleFontSize),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: spacingMedium),
                          SizedBox(
                            width: fieldWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "User ID",
                                  style: AppStyle.font20BlackSemiBold
                                      .copyWith(fontSize: subtitleFontSize),
                                ),
                                SizedBox(height: spacingSmall),
                                const CustomTextField(
                                  hint: "Enter your User ID",
                                  prefixIcon: Icons.email_outlined,
                                ),
                                SizedBox(height: spacingMedium),
                              ],
                            ),
                          ),
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
                ),
              ],
            ),
          ),
        ),
    );
  }
}
