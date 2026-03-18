import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mock_mate_ai/core/config/di.dart';
import 'package:mock_mate_ai/core/constants/app_asset.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'dart:ui';
import 'package:mock_mate_ai/features/feedback/widget/info_card.dart';
import 'package:mock_mate_ai/features/feedback/widget/overall_summary_card.dart';
import 'package:mock_mate_ai/features/feedback/widget/question_feedback_card.dart';
import 'package:mock_mate_ai/features/feedback/widget/section_header.dart';
import 'package:mock_mate_ai/features/session/viewmodel/get_session/get_session_cubit.dart';
import 'package:mock_mate_ai/features/session/viewmodel/get_session/get_session_state.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GetSessionCubit>()..getSession(sessionId: 22),
      child: Scaffold(
        body: BlocBuilder<GetSessionCubit, GetSessionState>(
          builder: (context, state) {
            if (state is GetSessionLoading) {
              return const Center(child: CircularProgressIndicator());
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
                  /// 🔥 الخلفية الجديدة
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Performance Feedback",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w900,
                                fontSize: 66.28,
                                color: const Color(0xff000000),
                              ),
                            ),
                            const SizedBox(height: 20),
                            OverallSummaryCard(
                              summary: feedback.overallSummary,
                              score: session.score.toString(),
                            ),
                            const SizedBox(height: 50),
                            IntrinsicHeight(
                              child: Row(
                                children: [
                                  InfoCard(
                                    backgroundColor: const Color(0x0D06F916),
                                    headerIcon: AppAsset.strength,
                                    title: "Strengths",
                                    descriptionIcon: Icons.done_all,
                                    descriptionIconColor: const Color(
                                      0xff10B981,
                                    ),
                                    descriptions: feedback.strengths,
                                    descriptionIconSize: 15,
                                  ),

                                  const SizedBox(width: 33.14),

                                  InfoCard(
                                    backgroundColor: const Color(0x0DF937A6),
                                    headerIcon: AppAsset.error,
                                    title: "Weaknesses",
                                    descriptionIcon: Icons.priority_high,
                                    descriptionIconColor: const Color(
                                      0xffF59E0B,
                                    ),
                                    descriptions: feedback.weaknesses,
                                    descriptionIconSize: 23.76,
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 90),

                            const SectionHeader(
                              title: "Detailed Feedback per Question",
                            ),

                            const SizedBox(height: 50),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: feedback.detailedFeedback.length,
                              itemBuilder: (context, index) {
                                final item = feedback.detailedFeedback[index];

                                final colors = [
                                  const Color(0xff10B981),
                                  const Color(0xffFBBF24),
                                  const Color(0xff3C473F),
                                ];

                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 40),
                                  child: QuestionFeedbackCard(
                                    number: index + 1,
                                    title: item.questionTitle,
                                    status: "Review",
                                    feedback: item.feedback,
                                    suggestion: item.suggestion,
                                    baseColor: colors[index % colors.length],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
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
