import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/theme/app_style.dart';
import '../../../../../../core/widget/arrow_button.dart';
import '../../../../../../core/widget/custom_button.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoints = ResponsiveBreakpoints.of(context);
    final isMobile = breakpoints.isMobile;

    final horizontalPadding = isMobile ? 22.0 : 60.0;
    final verticalPadding = isMobile ? 24.0 : 40.0;
    final titleFontSize = isMobile ? 25.0 : 35.0;
    final descFontSize = isMobile ? 14.0 : 18.0;
    final spacingTop = isMobile ? 40.0 : 80.0;
    final spacingMedium = isMobile ? 40.0 : 60.0;
    final spacingLarge = isMobile ? 70.0 : 100.0;
    final maxWidth = isMobile ? double.infinity : 600.0;

    return  Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ArrowButton(),
                Expanded(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: maxWidth),
                      child: Column(
                        children: [
                          SizedBox(height: spacingTop),
                          Text(
                            "Password reset",
                            style: AppStyle.font40BlackSemiBold
                                .copyWith(fontSize: titleFontSize),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: spacingMedium),
                          Text(
                            "Your password has been successfully reset. \nclick confirm to set a new password",
                            style: AppStyle.font16GrayMediumMedium
                                .copyWith(fontSize: descFontSize),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: spacingLarge),
                          CustomButton(
                            text: "confirm",
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.newPassword);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

    );
  }
}
