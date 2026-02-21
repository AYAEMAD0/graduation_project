import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';
import 'package:mock_mate_ai/core/widget/custom_text_field.dart';
import 'package:responsive_framework/responsive_framework.dart';

class StartSessionCard extends StatelessWidget {
  const StartSessionCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).isDesktop;

    return Center(
      child: Container(
        width: isDesktop ? 660 : double.infinity,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppColor.whiteColor.withOpacity(.9),
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: AppColor.blackColor.withOpacity(.1),
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
                const Icon(
                  Icons.rocket_launch,
                  size: 20,
                  color: AppColor.primaryPurpleColor,
                ),
                const SizedBox(width: 12),
                Text(
                  "Start New Session",
                  style: isDesktop
                      ? AppStyle.font24BlackBold
                      : AppStyle.font20BlackSemiBold,
                ),
              ],
            ),

            const SizedBox(height: 32),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColor.unactiveBorder, width: 1.5),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.cloud_upload_outlined,
                    size: 32,
                    color: AppColor.grayMediumColor,
                  ),
                  const SizedBox(height: 12),
                  Text("Upload CV (PDF)", style: AppStyle.font16BlackSemiBold),
                  const SizedBox(height: 4),
                  Text(
                    "or drag and drop here",
                    style: AppStyle.font14GrayRegular,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            Text("JOB DESCRIPTION", style: AppStyle.font15GrayDarkRegular),

            const SizedBox(height: 12),

            CustomTextField(
              hint: "Paste the job description here to analyze gaps...",
              maxLines: 5,
              borderColor: AppColor.unactiveBorder,
              keyboard: TextInputType.multiline,
            ),

            const SizedBox(height: 32),

            CustomButton(
              text: "Analyze Match",
              icon: Icons.arrow_forward,
              widthBtn: double.infinity,
              height: 56,
              borderRadius: 30,
              hasShadow: true,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
