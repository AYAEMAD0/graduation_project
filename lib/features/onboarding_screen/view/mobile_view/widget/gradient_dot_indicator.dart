import 'package:flutter/material.dart';
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
        width: width ?? 17,
        height: height ?? 17,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    )
        : Container(
      width: width ?? 15,
      height: height ?? 15,
      decoration: BoxDecoration(
        color: AppColor.grayLightColor,
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}