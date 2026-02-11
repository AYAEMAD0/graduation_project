import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/constants/app_asset.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';
import 'package:mock_mate_ai/core/widget/custom_text_field.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../widget/social_button.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
                    style: AppStyle.font24BlackBold.copyWith(fontSize: textFontSize),
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
                    onPressed: () {},
                  ),
                  SizedBox(height: spacingMedium),
                  Text(
                    " Or sign up using ",
                    style: AppStyle.font15GrayDarkRegular.copyWith(
                      fontSize: isMobile ? 15 : 18,
                    ),
                  ),
                  SizedBox(height: spacingMedium),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButton(icon: AppAsset.facebookIcon, onTap: () {}),
                      SizedBox(width: isMobile ? 20 : 30),
                      SocialButton(icon: AppAsset.googleIcon, onTap: () {}),
                    ],
                  ),
                  SizedBox(height: spacingLarge),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          "Don’t have an account?",
                          style: AppStyle.font16GrayRegular.copyWith(
                            fontSize: isMobile ? 16 : 18,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: isMobile ? 5 : 10),
                      Flexible(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, AppRoutes.signup);
                          },
                          child: Text(
                            "Sign Up",
                            style: AppStyle.font16BlackBold.copyWith(
                              fontSize: isMobile ? 16 : 18,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: spacingLarge),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
