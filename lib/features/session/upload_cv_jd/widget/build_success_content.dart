import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_style.dart';

class BuildSuccessContent extends StatelessWidget {
  const BuildSuccessContent({
    super.key,
    required this.text,
    required this.onRemove,
  });

  final String text;
  final void Function() onRemove;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return Column(
      children: [
        Icon(
          Icons.check_circle,
          size: isMobile ? 30 : 40,
          color: AppColor.purple,
        ),
        SizedBox(height: 8),
        Text(
          "CV Uploaded Successfully",
          style: AppStyle.font16BlackSemiBold.copyWith(
            fontSize: isMobile ? 16 : 20,
            color: AppColor.purple,
          ),
        ),
        SizedBox(height: 8),
        Text(
          text,
          style: AppStyle.font14GrayRegular.copyWith(
            fontSize: isMobile ? 13 : 16,
          ),
        ),
        SizedBox(height: 10),
        TextButton.icon(
          onPressed: onRemove,
          icon: const Icon(Icons.delete, color: Colors.red, size: 20),
          label: const Text(
            "Remove File",
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
