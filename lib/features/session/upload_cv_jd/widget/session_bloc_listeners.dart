import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_mate_ai/core/cache/interview_cache_service.dart';
import 'package:mock_mate_ai/core/widget/custom_dialog.dart';
import 'package:mock_mate_ai/core/widget/custom_toast.dart';

import '../../../../core/routes/app_routes.dart';
import '../../viewmodel/interview_session/ai_interview_cubit.dart';
import '../../viewmodel/interview_session/ai_interview_state.dart';
import '../../viewmodel/interview_session/interview_session_cubit.dart';
import '../../viewmodel/interview_session/interview_session_state.dart';

class SessionBlocListeners extends StatelessWidget {
  final Widget child;

  const SessionBlocListeners({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<InterviewSessionCubit, InterviewSessionState>(
          listener: (context, state) async {
            if (state is InterviewSessionError) {
              CustomDialog.hideLoading(context: context);
              CustomToast.showToast(message: state.message, context: context);
            }
            if (state is InterviewSessionSuccess) {
              CustomDialog.hideLoading(context: context);
              await InterviewCacheService.saveSession(
                state.interviewSession.toJson(),
              );
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.questionOverview,
                arguments: {'interviewSession': state.interviewSession},
              );
            }
          },
        ),
        BlocListener<AiInterviewCubit, AiInterviewState>(
          listener: (context, state) async {
            if (state is AiInterviewError) {
              CustomDialog.hideLoading(context: context);
              CustomToast.showToast(message: state.message, context: context);
            }
            if (state is AiInterviewSuccess) {
              CustomDialog.hideLoading(context: context);
              await InterviewCacheService.saveSession(
                state.interviewSession.toJson(),
              );
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.questionOverview,
                arguments: {'interviewSession': state.interviewSession},
              );
            }
          },
        ),
      ],
      child: child,
    );
  }
}
