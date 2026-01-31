import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/core/widget/arrow_button.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ArrowButton(),
              SizedBox(height: 50),
              Text("Password reset", style: AppStyle.font20BlackBold),
              SizedBox(height: 18),
              Text(
                "Your password has been successfully reset. click confirm to set a new password",
                style: AppStyle.font16GrayRegular,
              ),

              SizedBox(height: 33),
              Center(
                child: CustomButton(text: "confirm", onPressed: () {}),
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
