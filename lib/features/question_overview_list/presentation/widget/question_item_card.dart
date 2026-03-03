import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/features/question_overview_list/presentation/widget/action_button.dart';
import 'package:responsive_framework/responsive_framework.dart';

class QuestionItemCard extends StatelessWidget {
  final int index;
  final String title;
  final String type;
  final bool isModified;

  const QuestionItemCard({
    required this.index,
    required this.title,
    required this.type,
    required this.isModified,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFBBA6E8).withValues(alpha: 0.6),
          width: 1.2,
        ),
      ),
      child: isMobile
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "$index.",
                style: AppStyle.font20BlackSemiBold.copyWith(
                  color: AppColor.primaryPurpleColor,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: AppStyle.font20BlackSemiBold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            type,
            style: AppStyle.font16GrayMediumMedium.copyWith(
              color: AppColor.primaryPurpleColor,
            ),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: ActionButton(isModified: isModified),
          ),
        ],
      )
          : Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Text(
                  "$index.",
                  style: AppStyle.font20BlackSemiBold.copyWith(
                    color: AppColor.primaryPurpleColor,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: AppStyle.font20BlackSemiBold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                type,
                style: AppStyle.font16GrayMediumMedium.copyWith(
                  color: AppColor.primaryPurpleColor,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerRight,
              child: ActionButton(isModified: isModified),
            ),
          ),
        ],
      ),
    );
  }
}