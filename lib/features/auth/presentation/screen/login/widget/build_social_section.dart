import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../../../core/constants/app_asset.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/theme/app_style.dart';
import 'social_button.dart';

class BuildSocialSection extends StatelessWidget {
  const BuildSocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final spacingMedium = isMobile ? 25.0 : 30.0;
    final spacingLarge = isMobile ? 30.0 : 50.0;
    return Column(
      children: [
        Text(
          " Or sign up using ",
          style: AppStyle.font15GrayDarkRegular.copyWith(
            fontSize: isMobile ? 15 : 18,
          ),
        ),
        SizedBox(height: spacingMedium),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialButton(icon: AppAsset.facebookIcon, onTap: () {}),
            SizedBox(width: isMobile ? 20 : 30),
            SocialButton(icon: AppAsset.googleIcon, onTap: () {}),
          ],
        ),
        SizedBox(height: spacingLarge),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                "Don’t have an account?",
                style: AppStyle.font16GrayRegular.copyWith(
                  fontSize: isMobile ? 16 : 18,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Flexible(
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.signup);
                },
                child: Text(
                  "Sign Up",
                  style: AppStyle.font16BlackBold.copyWith(
                    fontSize: isMobile ? 16 : 18,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: spacingLarge),
      ],
    );
  }
}
