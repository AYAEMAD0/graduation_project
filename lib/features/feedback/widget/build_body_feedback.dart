import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/app_asset.dart';
import '../../../domain/entities/feedBack/feedback_model.dart';
import '../../../domain/entities/session/get_session/get_session_entity.dart';
import 'info_card.dart';
import 'overall_summary_card.dart';
import 'question_feedback_card.dart';
import 'section_header.dart';

class BuildBodyFeedback extends StatelessWidget {
  const BuildBodyFeedback({
    super.key,
    required this.feedback,
    required this.session,
  });

  final FeedbackModel feedback;
  final GetSessionEntity session;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Performance Feedback",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w900,
            fontSize: 40,
            color: const Color(0xff000000),
          ),
        ),
        const SizedBox(height: 15),
        OverallSummaryCard(
          summary: feedback.overallSummary,
          score: session.score.toString(),
        ),
        const SizedBox(height: 16),
        IntrinsicHeight(
          child: Row(
            children: [
              InfoCard(
                backgroundColor: const Color(0x0D06F916),
                headerIcon: AppAsset.strength,
                title: "Strengths",
                descriptionIcon: Icons.done_all,
                descriptionIconColor: const Color(0xff10B981),
                descriptions: feedback.strengths,
                descriptionIconSize: 15,
              ),

              const SizedBox(width: 20),

              InfoCard(
                backgroundColor: const Color(0x0DF937A6),
                headerIcon: AppAsset.error,
                title: "Weaknesses",
                descriptionIcon: Icons.priority_high,
                descriptionIconColor: const Color(0xffF59E0B),
                descriptions: feedback.weaknesses,
                descriptionIconSize: 23.76,
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        const SectionHeader(title: "Detailed Feedback per Question"),

        const SizedBox(height: 12),
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
              padding: const EdgeInsets.only(bottom: 12),
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
    );
  }
}
