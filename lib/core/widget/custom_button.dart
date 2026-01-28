import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_mate_ai/core/theme/app_gradient.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? widthBtn;
  const CustomButton({
    super.key,
    this.widthBtn,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        height: 54.h,
        width: widthBtn ?? 204.w,
        decoration: BoxDecoration(
          gradient: AppGradient.primaryGradient,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Center(child: Text(text, style: AppStyle.font16WhiteBold)),
      ),
    );
  }
}
