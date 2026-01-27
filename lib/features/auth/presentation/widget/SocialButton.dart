import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';

class SocialButton extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;

  const SocialButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50.r),
      child: Container(
        width: 51.w,
        height: 51.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColor.LightGrey, width: 1.w),
        ),
        child: Center(
          child: SvgPicture.asset(icon,width: 41.w,height: 41.h,),
        ),
      ),
    );
  }
}
