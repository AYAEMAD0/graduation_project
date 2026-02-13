import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/constants/app_asset.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';
import 'package:mock_mate_ai/core/widget/custom_text_field.dart';
import '../../../../../core/routes/app_routes.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'widget/build_social_section.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    final logoWidth = isMobile ? 180.0 : 200.0;
    final horizontalPadding = isMobile ? 20.0 : 60.0;
    final spacingMedium = isMobile ? 25.0 : 30.0;
    final spacingLarge = isMobile ? 30.0 : 50.0;
    final textFontSize = isMobile ? 24.0 : 34.0;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: isMobile ? double.infinity : 500,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAsset.logoAppImage,
                    width: logoWidth,
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    "Welcome back!",
                    style: AppStyle.font24BlackBold.copyWith(
                      fontSize: textFontSize,
                    ),
                    textAlign: TextAlign.center,
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.forgotPassword);
                      },
                      child: Text(
                        "Forgot Password?",
                        style: AppStyle.font14GrayMedium.copyWith(
                          fontSize: isMobile ? 14.0 : 16.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: spacingLarge),
                  CustomButton(
                    text: "LOG IN",
                    onPressed: () {
                      //todo logic home
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.uploadCvJd,
                        (Route<dynamic> route) => false,
                      );
                    },
                  ),
                  SizedBox(height: spacingMedium),
                  BuildSocialSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
