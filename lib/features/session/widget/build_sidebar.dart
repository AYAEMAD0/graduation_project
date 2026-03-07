import 'package:flutter/material.dart';

import '../../../core/constants/app_asset.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/theme/app_style.dart';
import '../model/session_arguments.dart';

class BuildSidebar extends StatelessWidget {
  const BuildSidebar({super.key, required this.args, required this.onTap});

  final SessionArguments args;
  final void Function(BuildContext, int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: double.infinity,
      decoration: const BoxDecoration(color: Color(0xffF3F4F6)),
      child: Column(
        children: [
          Image.asset(AppAsset.logoAppImage, width: 60, height: 60),
          GestureDetector(
            onTap: () {
              Navigator.popUntil(
                context,
                ModalRoute.withName(AppRoutes.questionOverview),
              );
              args.onQuestionSelected(0);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.symmetric(vertical: 3),
              decoration: BoxDecoration(
                color: args.currentQuestion == 0
                    ? const Color(0xffD5CDDD)
                    : Colors.transparent,
              ),
              alignment: Alignment.center,
              child: Text(
                "All",
                style: AppStyle.font16BlackSemiBold.copyWith(
                  color: args.currentQuestion == 0
                      ? AppColor.primaryPurpleColor
                      : AppColor.grayMediumColor,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: args.totalQuestions,
              itemBuilder: (context, index) {
                final number = index + 1;
                final isActive = number == args.currentQuestion;
                return GestureDetector(
                  onTap: () => onTap(context, number),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(vertical: 3),
                    height: 50,
                    decoration: BoxDecoration(
                      color: isActive
                          ? const Color(0xffD5CDDD)
                          : Colors.transparent,
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
