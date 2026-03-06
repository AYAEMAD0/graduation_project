import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/routes/app_routes.dart';
import 'package:mock_mate_ai/features/auth/presentation/screen/forgot/view/forgot_otp.dart';
import 'package:mock_mate_ai/features/auth/presentation/screen/login/view/login_screen.dart';
import 'package:mock_mate_ai/features/auth/presentation/screen/signup/view/signup_screen.dart';
import 'package:mock_mate_ai/features/main/main_layout.dart';
import 'package:mock_mate_ai/features/onboarding_screen/view/onboarding_screen.dart';
import 'package:mock_mate_ai/features/session/mcq_workspace/view/mcq_workspace.dart';
import 'package:mock_mate_ai/features/splash_screen/splash_screen.dart';

import '../../domain/entities/session/interview_session/interview_session_entity.dart';
import '../../features/auth/presentation/screen/forgot/view/forgot_password_screen.dart';
import '../../features/auth/presentation/screen/forgot/view/new_password.dart';
import '../../features/auth/presentation/screen/forgot/view/reset_password.dart';
import '../../features/auth/presentation/screen/forgot/view/successful_screen.dart';
import '../../features/score_screen/presentation/screens/score_screen.dart';
import '../../features/session/question_overview/view/question_overview.dart';
import '../../features/session/upload_cv_jd/view/upload_cv_jd.dart';
import '../../features/session/widget/question_sidebar.dart';

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
      AppRoutes.scoreScreen :(context)=> ScoreScreen(),
      AppRoutes.home :(context)=> MainLayout(),
      AppRoutes.questionOverview: (context) {
        final args =
            (ModalRoute.of(context)!.settings.arguments
                as Map<String, dynamic>?) ??
            {};
        return QuestionOverview(
          interviewSession: args['interviewSession'] as InterviewSessionEntity,
        );
      },

      // AppRoutes.codeWorkspace: (context) {
      //   final args =
      //       ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      //   if (args == null) return const SizedBox.shrink();
      //   return CodingWorkspace(
      //     currentQuestion: args['currentQuestion'] as int,
      //     totalQuestions: args['totalQuestions'] as int,
      //     remainingSeconds: args['remainingSeconds'] as int,
      //     questions: (args['questions'] as List).cast<SidebarQuestion>(),
      //     sessionId: args['sessionId'] as int,
      //     questionId: args['questionId'] as int,
      //     questionTitle: args['questionTitle'] as String,
      //     questionText: args['questionText'] as String,
      //     testCases: (args['testCases'] as List).cast<TestCaseEntity>(),
      //     templates: (args['templates'] as List).cast<CodeTemplateEntity>(),
      //     selectedAnswers: (args['selectedAnswers'] as Map).cast<int, int>(),
      //     onAnswerSelected: args['onAnswerSelected'] as void Function(int, int),
      //     onQuestionSelected: (_) {},
      //     savedCode: args['savedCode'] as Map<int, String>? ?? {},
      //     onCodeChanged:
      //         args['onCodeChanged'] as void Function(int, String)? ??
      //         (_, __) {},
      //   );
      // },
      AppRoutes.mcqWorkspace: (context) {
        final args =
            ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
        if (args == null) return const SizedBox.shrink();
        final selectedAnswers = args['selectedAnswers'] as Map<int, int>;
        final currentQuestion = args['currentQuestion'] as int;
        final onAnswerSelectedFn =
            args['onAnswerSelected'] as void Function(int, int);
        final savedQuestions = args['savedQuestions'] as Set<int>;
        final onQuestionSavedFn = args['onQuestionSaved'] as void Function(int);
        final questionId = args['questionId'] as int? ?? 0;

        return McqWorkspace(
          currentQuestion: currentQuestion,
          totalQuestions: args['totalQuestions'] as int,
          remainingSeconds: args['remainingSeconds'] as int,
          questions: (args['questions'] as List).cast<SidebarQuestion>(),
          questionText: args['questionText'] as String,
          questionId: args['questionId'] as int? ?? 0,
          options: (args['options'] as List).cast<McqOptionEntity>(),
          selectedAnswers: selectedAnswers,
          onAnswerSelected: (q, a) => onAnswerSelectedFn(q, a),
          onQuestionSelected:
              args['onQuestionSelected'] as void Function(int)? ?? (_) {},
          sessionId: args['sessionId'] as int,
          isSaved: savedQuestions.contains(questionId),
          onQuestionSaved: (id) => onQuestionSavedFn(id),
          savedQuestions: savedQuestions,
        );
      },
    };
  }
}
