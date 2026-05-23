import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_style.dart';

class BuildUploadContent extends StatelessWidget {
  const BuildUploadContent({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Column(
      children: [
        Icon(
          Icons.cloud_upload,
          size: isMobile ? 30 : 45,
          color: AppColor.grayMediumColor,
        ),
        SizedBox(height: 8),
        Text(
          "Upload CV (PDF)",
          style: AppStyle.font16BlackSemiBold.copyWith(
            color: isDark ? Colors.white : AppColor.blackColor,
            fontSize: isMobile ? 16 : 18,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "or drag and drop here",
          style: AppStyle.font14GrayRegular.copyWith(
            color: isDark ? Colors.white : AppColor.grayColor,
            fontSize: isMobile ? 14 : 16,
          ),
        ),
      ],
    );
  }
}
