import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:mock_mate_ai/core/constants/app_asset.dart';
import 'package:mock_mate_ai/core/theme/app_gradient.dart';
import 'package:mock_mate_ai/features/main/main_layout.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../core/helper/shared_check_helper.dart';
import '../auth/presentation/screen/login/view/login_screen.dart';
import '../onboarding_screen/view/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<Widget> _getNextScreen() async {
    final hasOnboarded = await SharedCheckHelper.getBoolValue(
      SharedCheckHelper.keyIsOnBoarding,
    );
    if (!hasOnboarded) {
      return OnboardingScreen();
    }
    final accessToken = await SharedCheckHelper.getValue(
      SharedCheckHelper.keyAccessToken,
    );
    if (accessToken != null && accessToken.isNotEmpty) {
      return const MainLayout();
    }
    return const LoginScreen();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final logoWidth = isMobile ? 180.0 : 220.0;

    return FutureBuilder<Widget>(
      future: _getNextScreen(),
      builder: (context, snapshot) {
        final nextScreen = snapshot.data ?? const LoginScreen();

        return AnimatedSplashScreen(
          duration: 5000,
          splashIconSize: double.infinity,
          backgroundColor: Colors.transparent,
          splash: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(gradient: AppGradient.gradientSplash),
            child: Center(
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 2600),
                curve: Curves.easeInOutCubic,
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.scale(
                      scale: 0.9 + (0.1 * value),
                      child: child,
                    ),
                  );
                },
                child: Image.asset(AppAsset.logoAppImage, width: logoWidth),
              ),
            ),
          ),
          nextScreen: nextScreen,
          splashTransition: SplashTransition.fadeTransition,
          animationDuration: const Duration(milliseconds: 300),
        );
      },
    );
  }
}
