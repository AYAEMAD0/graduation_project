import 'package:flutter/material.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40),
            Column(
              children: [
                Image.asset(AppAsset.logoAppImage, width: 200, height: 190),
                Text("Welcome back!", style: AppStyle.font24BlackBold),
                SizedBox(height: 30),
                SizedBox(
                  width: 900,
                  child: Column(
                    children: [
                      CustomTextField(
                        hint: "Email",
                        prefixIcon: Icons.email_outlined,
                      ),
                      SizedBox(height: 30),
                      CustomTextField(
                        hint: "Password",
                        prefixIcon: Icons.lock_outline,
                        obscure: true,
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Align(
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
                      ),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
                CustomButton(
                  text: "LOG IN",
                  onPressed: () {
                    // Handle login button press
                  },
                ),
                SizedBox(height: 20),
                Text(
                  " Or sign up using ",
                  style: AppStyle.font15GrayDarkRegular,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(
                      icon: AppAsset.facebookIcon,
                      onTap: () {
                        //  Facebook login
                      },
                    ),
                    SizedBox(width: 20),
                    SocialButton(
                      icon: AppAsset.googleIcon,
                      onTap: () {
                        // Google login
                      },
                    ),
                  ],
                ),
                SizedBox(height: 180),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account?",
                      style: AppStyle.font16GrayRegular,
                    ),
                    SizedBox(width: 3),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.signup,
                        );
                      },
                      child: Text("Sign Up", style: AppStyle.font16BlackBold),
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
