import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/constants/app_asset.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';

class QuestionSidebar extends StatelessWidget {
  final int currentIndex;
  final int totalQuestions;

  const QuestionSidebar({
    required this.currentIndex,
    required this.totalQuestions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: double.infinity,
      decoration: BoxDecoration(color: Color(0xffF3F4F6)),
      child: Column(
        children: [
          Image.asset(AppAsset.logoAppImage, width: 60, height: 60),
          Text(
            "All",
            style: AppStyle.font16BlackSemiBold.copyWith(
              color: AppColor.primaryPurpleColor,
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              itemCount: totalQuestions,
              itemBuilder: (context, index) {
                final number = index + 1;
                final isActive = number == currentIndex;
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 3),
                  height: 50,
                  decoration: BoxDecoration(
                    color: isActive ? Color(0xffD5CDDD) : Colors.transparent,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "$number",
                    style: AppStyle.font16BlackSemiBold.copyWith(
                      color: isActive
                          ? AppColor.primaryPurpleColor
                          : AppColor.grayMediumColor,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
