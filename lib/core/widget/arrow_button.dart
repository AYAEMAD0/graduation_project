import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mock_mate_ai/core/constants/app_asset.dart';
import 'package:mock_mate_ai/core/theme/app_gradient.dart';

class ArrowButton extends StatelessWidget {
  final VoidCallback? onTap;
  const ArrowButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => Navigator.pop(context),
      child: Container(
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
          gradient: AppGradient.primaryGradient,
          borderRadius: BorderRadius.circular(360.r),
        ),
        child: Center(
          child: SvgPicture.asset(AppAsset.arrowIcon, width: 8.w, height: 30.h),
        ),
      ),
    );
  }
}
