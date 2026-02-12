import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/constants/app_asset.dart';
import 'package:mock_mate_ai/core/routes/app_routes.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';
import 'package:mock_mate_ai/core/widget/custom_text_field.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    final horizontalPadding = isMobile ? 15.0 : 50.0;
    final logoWidth = isMobile ? 150.0 : 188.0;
    final logoHeight = isMobile ? 105.0 : 115.0;
    final spacingSmall = isMobile ? 10.0 : 15.0;
    final spacingMedium = isMobile ? 15.0 : 20.0;
    final spacingLarge = isMobile ? 30.0 : 50.0;
    final titleFontSize = isMobile ? 24.0 : 34.0;
    final textFontSize = isMobile ? 15.0 : 18.0;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: spacingMedium),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: isMobile ? double.infinity : 500,
              ),
              child: Column(
                children: [
                  Image.asset(AppAsset.logoAppImage, width: logoWidth, height: logoHeight),
                  SizedBox(height: spacingSmall),
                  Text(
                    "Let’s Get Started!",
                    style: AppStyle.font24BlackBold.copyWith(fontSize: titleFontSize),
                  ),
                  SizedBox(height: spacingMedium),
                  CustomTextField(
                    hint: "First Name",
                    prefixIcon: Icons.person_outline_sharp,
                  ),
                  SizedBox(height: spacingMedium),
                  CustomTextField(
                    hint: "Last Name",
                    prefixIcon: Icons.person_outline_sharp,
                  ),
                  SizedBox(height: spacingMedium),
                  CustomTextField(
                    hint: "Email",
                    prefixIcon: Icons.email_outlined,
                  ),
                  SizedBox(height: spacingMedium),
                  CustomTextField(
                    hint: "Password",
                    prefixIcon: Icons.lock_outline,
                    obscure: true,
                  ),
                  SizedBox(height: spacingMedium),
                  CustomTextField(
                    hint: "Confirm Password",
                    prefixIcon: Icons.lock_outline,
                    obscure: true,
                  ),
                  SizedBox(height: spacingMedium),
                  CustomButton(
                    text: "CREATE",
                    onPressed: () {},
                  ),
                  SizedBox(height: spacingLarge),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          "Already have an account?",
                          style: AppStyle.font16GrayRegular.copyWith(fontSize: textFontSize),
                        ),
                      ),
                      Flexible(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, AppRoutes.login);
                          },
                          child: Text(
                            "Login here",
                            style: AppStyle.font16BlackBold.copyWith(fontSize: textFontSize),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: spacingSmall,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
