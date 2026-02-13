import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/core/widget/arrow_button.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';
import 'package:mock_mate_ai/features/auth/presentation/screen/forgot/widget/otp_fields.dart';
import '../../../../../../core/routes/app_routes.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ForgotOtp extends StatelessWidget {
  const ForgotOtp({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    final horizontalPadding = isMobile ? 22.0 : 60.0;
    final titleFontSize = isMobile ? 25.0 : 35.0;
    final subtitleFontSize = isMobile ? 16.0 : 25.0;
    final emailFontSize = isMobile ? 14.0 : 20.0;
    final spacingSmall = isMobile ? 15.0 : 20.0;
    final spacingLarge = isMobile ? 30.0 : 35.0;
    final otpFieldWidth = isMobile ? double.infinity : 700.0;
    final bottomTextFontSize = isMobile ? 14.0 : 16.0;

    return  Scaffold(
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
                Expanded(
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: spacingSmall),
                          Text(
                            "Enter OTP",
                            style: AppStyle.font40BlackSemiBold
                                .copyWith(fontSize: titleFontSize),
                          ),
                          SizedBox(height: spacingSmall),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text:
                              "Please enter OTP sent to your registered phone \nemail: ",
                              style: AppStyle.font25GrayMediumSemiBold
                                  .copyWith(fontSize: subtitleFontSize),
                              children: [
                                TextSpan(
                                  text: "XXXXX@gmail.com",
                                  style: AppStyle.font20BlackSemiBold
                                      .copyWith(fontSize: emailFontSize),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: spacingLarge),
                          SizedBox(
                            width: otpFieldWidth,
                            child: OtpFields(otpLength: 5),
                          ),
                          SizedBox(height: spacingLarge),
                          CustomButton(
                            text: "Verify",
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.resetPassword);
                            },
                          ),
                          SizedBox(height: spacingLarge),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Haven’t got the otp yet? ",
                                style: AppStyle.font16GrayMediumSemiBold
                                    .copyWith(fontSize: bottomTextFontSize),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // resend otp logic
                                },
                                child: Text(
                                  "Resend Otp",
                                  style: AppStyle.font16BlackSemiBold.copyWith(
                                    fontSize: bottomTextFontSize,
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
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
