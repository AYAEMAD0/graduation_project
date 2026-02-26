import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';
import 'package:mock_mate_ai/core/widget/custom_text_field.dart';
import 'package:mock_mate_ai/features/upload_cv_jd/widget/build_upload_cv_section.dart';
import 'package:responsive_framework/responsive_framework.dart';

class StartSessionCard extends StatelessWidget {
  const StartSessionCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Center(
      child: Container(
        width: isMobile ? double.infinity : 1500,
        padding: EdgeInsets.all(isMobile ? 32 : 50),
        margin: EdgeInsets.symmetric(horizontal: isMobile ? 15 : 25),
        decoration: BoxDecoration(
          color: AppColor.whiteDarkColor,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: AppColor.blackColor.withValues(alpha: 0.2),
              blurRadius: 60,
              offset: const Offset(0, 25),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.rocket_launch,
                  size: isMobile ? 25 : 60,
                  color: AppColor.purple,
                ),
                SizedBox(width: isMobile ? 12 : 22),
                Flexible(
                  child: Text(
                    "Start New Session",
                    overflow: TextOverflow.ellipsis,
                    style: isMobile
                        ? AppStyle.font20BlackSemiBold
                        : AppStyle.font24BlackBold.copyWith(fontSize: 40),
                  ),
                ),
              ],
            ),
            SizedBox(height: isMobile ? 25 : 40),
            BuildUploadCvSection(),
            SizedBox(height: isMobile ? 25 : 45),
            Text(
              "JOB DESCRIPTION",
              style: isMobile
                  ? AppStyle.font18BlackSemiBold.copyWith(
                      color: Color(0xff64748B),
                    )
                  : AppStyle.font24BlackBold.copyWith(color: Color(0xff64748B)),
            ),
            SizedBox(height: isMobile ? 12 : 20),
            CustomTextField(
              hint: "Paste the job description here to analyze gaps...",
              hintStyle: AppStyle.font14GrayRegular.copyWith(
                fontSize: isMobile ? 14 : 22,
              ),
              maxLines: isMobile ? 3 : 5,
              borderColor: Color(0xffCBD5E1),
              keyboard: TextInputType.multiline,
            ),
            SizedBox(height: isMobile ? 25 : 50),
            CustomButton(
              widthBtn: double.infinity,
              height: isMobile ? 56 : 75,
              borderRadius: 20,
              hasShadow: true,
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                spacing: isMobile?8:15,
                children: [
                  Flexible(
                    child: Text(
                      "Analyze Match",
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle.font18WhiteBold.copyWith(
                        fontSize: isMobile ? 18 : 30,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: AppColor.whiteColor,
                    size: isMobile?20:30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
