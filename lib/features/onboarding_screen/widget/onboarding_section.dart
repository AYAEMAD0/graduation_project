import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_style.dart';

class OnboardingSection extends StatelessWidget {
  final String title;
  final String image;
  final String description;

  const OnboardingSection({
    super.key,
    required this.title,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppStyle.font34BlackSemiBold,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30.h),
        Image.asset(
          image,
          height: 300.h,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 30.h),
        Text(
          description,
          style: AppStyle.font22BlackLight,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
