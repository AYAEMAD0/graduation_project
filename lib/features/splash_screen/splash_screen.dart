import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/constants/app_asset.dart';
import 'package:mock_mate_ai/core/theme/app_gradient.dart';
import 'package:mock_mate_ai/features/main/main_layout.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../core/helper/shared_check_helper.dart';
import '../auth/presentation/screen/login/view/login_screen.dart';
import '../onboarding_screen/view/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<Widget> _getNextScreen() async {
    final hasOnboarded = await SharedCheckHelper.getBoolValue(
      SharedCheckHelper.keyIsOnBoarding,
    );
    if (!hasOnboarded) return OnboardingScreen();
    final accessToken = await SharedCheckHelper.getValue(
      SharedCheckHelper.keyAccessToken,
    );
    if (accessToken != null && accessToken.isNotEmpty) {
      return const MainLayout();
    }
    return const LoginScreen();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 5000), () async {
      final next = await _getNextScreen();
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => next,
          transitionsBuilder: (_, animation, __, child) =>
              FadeTransition(opacity: animation, child: child),
          transitionDuration: const Duration(milliseconds: 300),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final logoWidth = isMobile ? 180.0 : 320.0;

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return FutureBuilder<Widget>(
      future: _getNextScreen(),
      builder: (context, snapshot) {
        final nextScreen = snapshot.data ?? const LoginScreen();

        return AnimatedSplashScreen(
          duration: 5000,
          splashIconSize: double.infinity,
          backgroundColor: isDark ? Theme.of(context).scaffoldBackgroundColor : Colors.white,
          splash: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: isDark
                  ? LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).scaffoldBackgroundColor.withValues(alpha: 0.95),
                ],
              )
                  : AppGradient.gradientSplash,
            ),
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
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
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
    );
  }
}