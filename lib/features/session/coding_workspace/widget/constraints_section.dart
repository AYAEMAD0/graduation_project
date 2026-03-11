import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';

class ConstraintsSection extends StatelessWidget {
  const ConstraintsSection({super.key, required this.descConstraints});

  final String descConstraints;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            descConstraints,
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
