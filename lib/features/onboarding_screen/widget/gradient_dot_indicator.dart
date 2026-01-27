import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_gradient.dart';

class GradientDotIndicator extends StatelessWidget {
  final bool isActive;
  final double? width;
  final double? height;

  const GradientDotIndicator({
    super.key,
    required this.isActive,
    this.width,
    this.height
  });

  @override
  Widget build(BuildContext context) {
    return isActive
        ? ShaderMask(
      shaderCallback: (bounds) => AppGradient.primaryGradient.createShader(bounds),
      child: Container(
        width: width ?? 17.w,
        height: height ?? 17.h,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(25.r),
        ),
      ),
    )
        : Container(
      width: width ?? 15.w,
      height: height ?? 15.h,
      decoration: BoxDecoration(
        color: AppColor.grayLightColor,
        borderRadius: BorderRadius.circular(25.r),
      ),
    );
  }
}
