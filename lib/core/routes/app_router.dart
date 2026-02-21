import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/routes/app_routes.dart';
import 'package:mock_mate_ai/features/auth/presentation/screen/login/view/login_screen.dart';
import 'package:mock_mate_ai/features/auth/presentation/screen/signup/view/signup_screen.dart';
import 'package:mock_mate_ai/features/auth/presentation/screen/forgot/view/forgot_otp.dart';
import 'package:mock_mate_ai/features/extracted_skill/extracted_skill_screen.dart';
import 'package:mock_mate_ai/features/home/main_layout.dart';
import 'package:mock_mate_ai/features/interview_session/interview_session.dart';
import 'package:mock_mate_ai/features/onboarding_screen/view/onboarding_screen.dart';
import 'package:mock_mate_ai/features/splash_screen/splash_screen.dart';
import 'package:mock_mate_ai/features/upload_cv_jd/upload_cv_jd.dart';
import '../../features/auth/presentation/screen/forgot/view/forgot_password_screen.dart';
import '../../features/auth/presentation/screen/forgot/view/new_password.dart';
import '../../features/auth/presentation/screen/forgot/view/reset_password.dart';
import '../../features/auth/presentation/screen/forgot/view/successful_screen.dart';
import '../../features/interview_setup/presentation/screens/interview_setup_screen.dart';
import '../../features/score_screen/presentation/screens/score_screen.dart';


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
      AppRoutes.uploadCvJd: (context) =>  UploadCvJd(),
      AppRoutes.interviewSetup : (context)=> InterviewSetupScreen(),
      AppRoutes.interviewSession: (context) =>  InterviewSession(),
      AppRoutes.scoreScreen :(context)=> ScoreScreen(),
      AppRoutes.extractedSkill :(context)=> ExtractedSkillScreen(),
      AppRoutes.home :(context)=> MainLayout(),
    };
  }
}
