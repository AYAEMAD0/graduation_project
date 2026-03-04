import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';

class ConstraintsSection extends StatelessWidget {
  const ConstraintsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "FUNCTION DESCRIPTION",
          style: AppStyle.font16WhiteBold.copyWith(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 12),
        RichText(
          text: TextSpan(
            style: AppStyle.font14GrayMedium.copyWith(
              color: AppColor.darkGray,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            children: [
              TextSpan(
                text: "Complete the function",
                style: AppStyle.font16GrayRegular.copyWith(
                  fontSize: 12,
                  color: AppColor.slateGray,
                ),
              ),
              TextSpan(
                text: "`isPrime`",
                style: GoogleFonts.jetBrainsMono(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  height: 20.57 / 12,
                  letterSpacing: 0,
                  color: AppColor.blackColor,
                ),
              ),
              TextSpan(
                text: " in the editor below.",
                style: AppStyle.font16GrayRegular.copyWith(
                  fontSize: 12,
                  color: AppColor.slateGray,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "long n",
                style: AppStyle.font14GrayMedium.copyWith(
                  color: AppColor.slateDark,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "a long integer to test",
                style: AppStyle.font16GrayRegular.copyWith(
                  fontSize: 12,
                  color: AppColor.slateGray,
                ),
              ),
            ],
          ),
        ),
        Divider(height: 40, endIndent: 18,),
        Text(
          "CONSTRAINTS",
          style: AppStyle.font16WhiteBold.copyWith(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Text(
            "2 ≤ n ≤ 10¹²",
            style: AppStyle.font16GrayRegular.copyWith(
              fontSize: 12,
              color: AppColor.slateGray,
            ),
          ),
        ),
      ],
    );
  }
}
