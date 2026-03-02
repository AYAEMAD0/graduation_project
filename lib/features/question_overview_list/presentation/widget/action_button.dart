import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';

class ActionButton extends StatelessWidget {
  final bool isModified;

  const ActionButton({super.key, required this.isModified});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 42,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
       color:isModified
           ? Colors.transparent:AppColor.purple,
          borderRadius: BorderRadius.circular(10),
          border: isModified
              ? Border.all(
            color: AppColor.primaryPurpleColor,
            width: 2,
          )
              : null,
        ),
        child: Text(
          isModified ? "Modify" : "Solve",
          style: isModified
              ? AppStyle.font16BlackSemiBold.copyWith(
            color: AppColor.primaryPurpleColor,
          )
              : AppStyle.font16WhiteBold,
        ),
      ),
    );
  }
}