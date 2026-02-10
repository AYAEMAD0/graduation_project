import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_gradient.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/core/widget/arrow_button.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';

class SuccessfulScreen extends StatelessWidget {
  const SuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.0.w, vertical: 24.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ArrowButton(),
              SizedBox(height: 50.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 98.w,
                    height: 98.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 2.w,
                        color: AppColor.primaryPurpleColor,
                      ),
                      gradient: AppGradient.primaryGradient,
                    ),
                    child: Icon(
                      Icons.check,
                      color: AppColor.whiteColor,
                      size: 45.sp,
                    ),
                  ),
                  SizedBox(height: 44.h),
                  Text('Successful', style: AppStyle.font20BlackSemiBold),
                  SizedBox(height: 23.h),
                  Text(
                    'Congratulations! Your password has been successfully updated. Click Continue to login',
                    textAlign: TextAlign.center,
                    style: AppStyle.font16GrayMediumMedium,
                  ),
                  SizedBox(height: 137.h),
                  CustomButton(text: "Continue", onPressed: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
