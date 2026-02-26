import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/helper/picker_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../core/theme/app_color.dart';
import '../../../core/theme/app_style.dart';

class BuildUploadCvSection extends StatelessWidget {
  const BuildUploadCvSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return InkWell(
      onTap: () async {
        final file = await PickerHelper.pickFile(context, ['pdf']);
        if (file != null) {
          debugPrint("Picked file: ${file.name}, size: ${file.size}");
          //todo send into backend
        }
      },
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          dashPattern: [10, 5],
          strokeWidth: 2.5,
          color: Color(0xffCBD5E1),
          radius: Radius.circular(25),
        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: isMobile ? 40 : 90),
          child: Column(
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
          ),
        ),
      ),
    );
  }
}
