import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_mate_ai/core/config/di.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/features/feedback/viewmodel/get_session/get_session_cubit.dart';
import 'package:mock_mate_ai/features/feedback/viewmodel/get_session/get_session_state.dart';
import 'package:mock_mate_ai/features/feedback/widget/build_body_feedback.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key, required this.sessionId});

  final int sessionId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt<GetSessionCubit>()
        ..getSession(sessionId: sessionId), //todo--22
      child: Scaffold(
        body: BlocBuilder<GetSessionCubit, GetSessionState>(
          builder: (context, state) {
            if (state is GetSessionLoading) {
              return Center(
                  child: CircularProgressIndicator(color: Color(0xffA855F7)));
            }

            if (state is GetSessionError) {
              return Center(child: Text(state.message));
            }

            if (state is GetSessionSuccess) {
              final session = state.session;
              final feedback = state.feedback;

              if (feedback == null) {
                return const Center(child: Text("No Feedback"));
              }
              return Stack(
                children: [
                  Positioned.fill(
                    child: IgnorePointer(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: -60,
                            left: -300,
                            child: ImageFiltered(
                              imageFilter: ImageFilter.blur(
                                sigmaX: 100,
                                sigmaY: 100,
                              ),
                              child: Container(
                                width: 800,
                                height: 700,
                                decoration: BoxDecoration(
                                  color: AppColor.homeEffectBlue.withValues(
                                    alpha: 0.15,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: -100,
                            child: ImageFiltered(
                              imageFilter: ImageFilter.blur(
                                sigmaX: 300,
                                sigmaY: 100,
                              ),
                              child: Container(
                                width: 600,
                                height: 600,
                                decoration: BoxDecoration(
                                  color: const Color(
                                    0xffE2ECF1,
                                  ).withValues(alpha: 0.90),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: -150,
                            child: ImageFiltered(
                              imageFilter: ImageFilter.blur(
                                sigmaX: 600,
                                sigmaY: 400,
                              ),
                              child: Container(
                                width: 1500,
                                height: 900,
                                decoration: BoxDecoration(
                                  color: AppColor.grayColor.withValues(
                                    alpha: 0.18,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: -150,
                            child: ImageFiltered(
                              imageFilter: ImageFilter.blur(
                                sigmaX: 100,
                                sigmaY: 100,
                              ),
                              child: Container(
                                width: 900,
                                height: 900,
                                decoration: BoxDecoration(
                                  color: AppColor.purple.withValues(
                                    alpha: 0.16,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: SingleChildScrollView(
                      child: Container(
                        width: 1414,
                        padding: const EdgeInsets.fromLTRB(
                          22.09,
                          66.28,
                          22.09,
                          66.28,
                        ),
                        child: BuildBodyFeedback(
                          feedback: feedback, session: session,),
                      ),
                    ),
                  ),
                ],
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
