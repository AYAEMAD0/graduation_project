import 'package:flutter/material.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_style.dart';
import '../../../../core/widget/custom_text_field.dart';

class JobDescriptionField extends StatelessWidget {
  const JobDescriptionField({
    super.key,
    required this.isMobile,
    required this.controller,
  });

  final bool isMobile;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "JOB DESCRIPTION",
          style: isMobile
              ? AppStyle.font18BlackSemiBold.copyWith(
                  color: const Color(0xff64748B),
                )
              : AppStyle.font24BlackBold.copyWith(
              color: const Color(0xff64748B), fontSize: 18
                ),
        ),
        SizedBox(height: 8),
        CustomTextField(
          controller: controller,
          hint: "Paste the job description here to analyze gaps...",
          hintStyle: AppStyle.font14GrayRegular.copyWith(
            fontSize: isMobile ? 14 : 18,
          ),
          maxLines: 3,
          cursorColor: AppColor.purple,
          borderColor: const Color(0xffCBD5E1),
          borderFocuseColor: AppColor.purple,
          keyboard: TextInputType.multiline,
        ),
      ],
    );
  }
}
