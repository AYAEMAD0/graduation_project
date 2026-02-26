import 'package:flutter/material.dart';
import '../../../core/theme/app_color.dart';

class BuildDivider extends StatelessWidget {
  const BuildDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return  Divider(
      color: AppColor.whiteColor,
      thickness: 1.4,
      endIndent: 14,
      indent: 20,
    );
  }
}
