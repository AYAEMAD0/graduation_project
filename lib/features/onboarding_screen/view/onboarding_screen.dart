import 'package:flutter/material.dart';
import 'mobile_view/mobile_onboarding_view.dart';
import 'web_view/web_onboarding_view.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 800) {
      return MobileOnboardingView();
    } else {
      return WebOnboardingView();
    }
  }
}
