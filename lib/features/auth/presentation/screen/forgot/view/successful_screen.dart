import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/widget/success_circle.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/theme/app_style.dart';
import '../../../../../../core/widget/arrow_button.dart';
import '../../../../../../core/widget/custom_button.dart';

class SuccessfulScreen extends StatelessWidget {
  const SuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoints = ResponsiveBreakpoints.of(context);
    final isMobile = breakpoints.isMobile;

    final horizontalPadding = isMobile ? 22.0 : 60.0;
    final verticalPadding = isMobile ? 24.0 : 40.0;
    final titleFontSize = isMobile ? 25.0 : 35.0;
    final descFontSize = isMobile ? 16.0 : 18.0;
    final spacingTop = isMobile ? 40.0 : 42.0;
    final spacingBetween = isMobile ? 20.0 : 25.0;
    final spacingLarge = isMobile ? 40.0 : 45.0;
    final maxWidth = isMobile ? double.infinity : 600.0;

    return Scaffold(
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
              SizedBox(height: spacingTop),
              Expanded(
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: maxWidth),
                    child: Column(
                      children: [
                        SuccessCircle(),
                        SizedBox(height: spacingBetween),
                        Text(
                          'Successful',
                          style: AppStyle.font40BlackSemiBold.copyWith(
                            fontSize: titleFontSize,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: spacingBetween),
                        Text(
                          'Congratulations! Your password has been successfully updated.Click Continue to login',
                          textAlign: TextAlign.center,
                          style: AppStyle.font18GrayMediumMedium.copyWith(
                            fontSize: descFontSize,
                          ),
                        ),
                        SizedBox(height: spacingLarge),
                        CustomButton(
                          text: "Continue",
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              AppRoutes.login,
                              (Route<dynamic> route) => false,
                            );
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
