import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/routes/app_routes.dart';
import 'package:mock_mate_ai/features/auth/presentation/screen/forgot/view/forgot_otp.dart';
import 'package:mock_mate_ai/features/auth/presentation/screen/login/view/login_screen.dart';
import 'package:mock_mate_ai/features/auth/presentation/screen/signup/view/signup_screen.dart';
import 'package:mock_mate_ai/features/main/main_layout.dart';
import 'package:mock_mate_ai/features/main/tabs/history/view/history_tab.dart';
import 'package:mock_mate_ai/features/onboarding_screen/view/onboarding_screen.dart';
import 'package:mock_mate_ai/features/session/mcq_workspace/view/mcq_workspace.dart';
import 'package:mock_mate_ai/features/splash_screen/splash_screen.dart';

import '../../domain/entities/session/interview_session/interview_session_entity.dart';
import '../../features/auth/presentation/screen/forgot/view/forgot_password_screen.dart';
import '../../features/auth/presentation/screen/forgot/view/new_password.dart';
import '../../features/auth/presentation/screen/forgot/view/reset_password.dart';
import '../../features/auth/presentation/screen/forgot/view/successful_screen.dart';
import '../../features/score_screen/presentation/screens/score_screen.dart';
import '../../features/session/coding_workspace/view/coding_workspace.dart';
import '../../features/session/model/session_arguments.dart';
import '../../features/session/question_overview/view/question_overview.dart';
import '../../features/session/upload_cv_jd/view/upload_cv_jd.dart';
import '../widget/session_expired.dart';

class AppRouter {
  static Map<String, Widget Function(BuildContext)> get routes {
    return {
      AppRoutes.splash: (context) => const SplashScreen(),
      AppRoutes.onBoarding: (context) => OnboardingScreen(),
      AppRoutes.login: (context) => LoginScreen(),
      AppRoutes.signup: (context) => SignupScreen(),
      AppRoutes.forgotPassword: (context) => ForgotPasswordScreen(),
      AppRoutes.forgotOtp: (context) => ForgotOtp(),
      AppRoutes.resetPassword: (context) => ResetPassword(),
      AppRoutes.newPassword: (context) => NewPassword(),
      AppRoutes.successful: (context) => SuccessfulScreen(),
      AppRoutes.uploadCvJd: (context) => UploadCvJd(),
      AppRoutes.scoreScreen: (context) => ScoreScreen(),
      AppRoutes.home: (context) => MainLayout(),
      AppRoutes.history: (context) => HistoryTab(),

      AppRoutes.questionOverview: (context) {
        final args =
            ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
        final interviewSession =
            args?['interviewSession'] as InterviewSessionEntity?;
        if (interviewSession == null) {
          return const SessionExpired();
        }
        return QuestionOverview(interviewSession: interviewSession);
      },

      AppRoutes.codeWorkspace: (context) {
        final args =
            ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
        if (args == null) return const SizedBox.shrink();
        final sessionArgs = args['sessionArgs'] as SessionArguments;
        return CodingWorkspace(
          args: sessionArgs,
          questionId: args['questionId'] as int,
          questionTitle: args['questionTitle'] as String,
          questionText: args['questionText'] as String,
          testCases: (args['testCases'] as List).cast<TestCaseEntity>(),
          templates: (args['templates'] as List).cast<CodeTemplateEntity>(),
          savedCode: args['savedCode'] as Map<int, String>? ?? {},
          savedLanguageId: args['savedLanguageId'] as int?,
          onCodeChanged:
              args['onCodeChanged'] as void Function(int, String)? ??
              (_, __) {},
          onCodeSaved:
              args['onCodeSaved'] as void Function(int, String)? ?? (_, __) {},
          onCodeReverted:
              args['onCodeReverted'] as void Function(int)? ?? (_) {},
        );
      },

      AppRoutes.mcqWorkspace: (context) {
        final args =
            ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
        if (args == null) return const SizedBox.shrink();
        final sessionArgs = args['sessionArgs'] as SessionArguments;
        final questionId = args['questionId'] as int? ?? 0;
        return McqWorkspace(
          args: sessionArgs,
          questionId: questionId,
          questionText: args['questionText'] as String,
          options: (args['options'] as List).cast<McqOptionEntity>(),
          isSaved: sessionArgs.savedQuestions.contains(questionId),
        );
      },
    };
  }
}
