import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/theme/app_style.dart';

class BuildBottomAlready extends StatelessWidget {
  const BuildBottomAlready({super.key});
  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final textFontSize = isMobile ? 15.0 : 18.0;

    return   Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            "Already have an account?",
            style: AppStyle.font16GrayRegular.copyWith(
              fontSize: textFontSize,
            ),
          ),
        ),
        Flexible(
          child: TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.login,
              );
            },
            child: Text(
              "Login here",
              style: AppStyle.font16BlackBold.copyWith(
                fontSize: textFontSize,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
