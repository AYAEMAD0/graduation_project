import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/routes/app_routes.dart';
import 'package:mock_mate_ai/features/auth/presentation/forgot_password/forgot_password_screen.dart';
import 'package:mock_mate_ai/features/auth/presentation/screen/login/login_screen.dart';
import 'package:mock_mate_ai/features/auth/presentation/screen/signup/signup_screen.dart';
import 'package:mock_mate_ai/features/onboarding_screen/view/onboarding_screen.dart';
import 'package:mock_mate_ai/features/splash_screen/splash_screen.dart';
import 'package:mock_mate_ai/features/verfiy_screen/verify_screen.dart';


class AppRouter {
  static Map<String, Widget Function(BuildContext)> get routes {
    return {
      AppRoutes.splash: (context) => const SplashScreen(),
      AppRoutes.verify: (context) => const VerifyScreen(),
      AppRoutes.onBoarding: (context) =>  OnboardingScreen(),
      AppRoutes.login: (context) =>  LoginScreen(),
      AppRoutes.signup: (context) =>  SignupScreen(),
      AppRoutes.forgotPassword : (context) =>  ForgotPasswordScreen(),
    };
  }
}
