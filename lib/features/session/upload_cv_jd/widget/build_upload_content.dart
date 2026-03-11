import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_style.dart';

class BuildUploadContent extends StatelessWidget {
  const BuildUploadContent({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Column(
      children: [
        Icon(
          Icons.cloud_upload,
          size: isMobile ? 30 : 70,
          color: AppColor.grayMediumColor,
        ),
        SizedBox(height: isMobile ? 12 : 22),
        Text(
          "Upload CV (PDF)",
          style: AppStyle.font16BlackSemiBold.copyWith(
            fontSize: isMobile ? 16 : 25,
          ),
        ),
        SizedBox(height: isMobile ? 6 : 12),
        Text(
          "or drag and drop here",
          style: AppStyle.font14GrayRegular.copyWith(
            fontSize: isMobile ? 14 : 20,
          ),
        ),
      ],
    );
  }
}
