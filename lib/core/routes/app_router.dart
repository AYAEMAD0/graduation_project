import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/routes/app_routes.dart';
import 'package:mock_mate_ai/features/auth/presentation/screen/forgot/view/forgot_password_screen.dart';
import 'package:mock_mate_ai/features/auth/presentation/screen/forgot/view/new_password.dart';
import 'package:mock_mate_ai/features/auth/presentation/screen/forgot/view/successful_screen.dart';
import 'package:mock_mate_ai/features/auth/presentation/screen/login/login_screen.dart';
import 'package:mock_mate_ai/features/auth/presentation/screen/signup/signup_screen.dart';
import 'package:mock_mate_ai/features/auth/presentation/screen/forgot/view/forgot_otp.dart';
import 'package:mock_mate_ai/features/onboarding_screen/view/onboarding_screen.dart';
import 'package:mock_mate_ai/features/splash_screen/splash_screen.dart';
import '../../features/auth/presentation/screen/forgot/view/reset_password.dart';


class AppRouter {
  static Map<String, Widget Function(BuildContext)> get routes {
    return {
      AppRoutes.splash: (context) => const SplashScreen(),
      AppRoutes.onBoarding: (context) =>  OnboardingScreen(),
      AppRoutes.login: (context) =>  LoginScreen(),
      AppRoutes.signup: (context) =>  SignupScreen(),
      AppRoutes.forgotPassword : (context) =>  ForgotPasswordScreen(),
      AppRoutes.forgotOtp: (context) =>  ForgotOtp(),
      AppRoutes.resetPassword: (context) =>  ResetPassword(),
      AppRoutes.newPassword: (context) =>  NewPassword(),
      AppRoutes.successful: (context) =>  SuccessfulScreen(),
    };
  }
}
