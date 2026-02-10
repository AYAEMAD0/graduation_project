import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/core/widget/arrow_button.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';

import '../../../../../../core/routes/app_routes.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.0.w, vertical: 24.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ArrowButton(),
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 50.h),
                    Text("Password reset", style: AppStyle.font40BlackSemiBold),
                    SizedBox(height: 50.h),
                    Text(
                      "Your password has been successfully reset. \nclick confirm to set a new password",
                      style: AppStyle.font16GrayMediumMedium,
                    ),
                    SizedBox(height: 80.h),
                    CustomButton(
                      text: "confirm",
                      onPressed: () {
                        //logic confirm
                        Navigator.pushNamed(context, AppRoutes.newPassword);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
