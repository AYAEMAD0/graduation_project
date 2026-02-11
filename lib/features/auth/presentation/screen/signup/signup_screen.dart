import 'package:flutter/material.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Center(
          child: SizedBox(
            width: 900,
            child: Column(
              children: [
                Image.asset(AppAsset.logoAppImage, width: 188, height: 144),
                SizedBox(height: 10),
                Text("Let’s Get Started!", style: AppStyle.font24BlackBold),
                SizedBox(height: 30),
                CustomTextField(
                  hint: "First Name",
                  prefixIcon: Icons.person_outline_sharp,
                ),
                SizedBox(height: 30),
                CustomTextField(
                  hint: "Last Name",
                  prefixIcon: Icons.person_outline_sharp,
                ),
                SizedBox(height: 30),
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
                CustomTextField(
                  hint: "Confirm Password",
                  prefixIcon: Icons.lock_outline,
                  obscure: true,
                ),
                SizedBox(height: 30),
                CustomButton(
                  text: "CREATE",
                  onPressed: () {
                    // Handle create button press
                  },
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: AppStyle.font16GrayRegular,
                    ),
                    SizedBox(width: 3),
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
