import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/features/main/tabs/history/viewModel/history_cubit.dart';
import 'package:mock_mate_ai/features/main/tabs/history/viewModel/history_state.dart';
import 'history_card.dart';

class HistoryListView extends StatelessWidget {
  const HistoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (context, state) {
        if (state is HistoryLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HistorySuccess) {
          if (state.interviews.isEmpty) {
            return const Center(child: Text("No Interviews Found"));
          }

          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            itemCount: state.interviews.length,
            itemBuilder: (context, index) {
              final interview = state.interviews[index];

              Color scoreColor = interview.score >= 75
                  ? Colors.green
                  : Colors.orange;

              return HistoryCard(
                title: interview.position,
                company: "Mock Mate AI",
                type: interview.status,
                score: "${interview.score.toInt()}%",
                time: _formatDate(interview.date),
                notifications: 0,
                icon: Icons.mic,
                scoreColor: scoreColor,
                iconColor: AppColor.primaryBlueColor,
                iconBackgroundColor: const Color(0xFFE8F0FE),
              );
            },
          );
        } else if (state is HistoryError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox.shrink();
      },
    );
  }

  String _formatDate(String dateStr) {
    if (dateStr.isEmpty) return "";
    try {
      final date = DateTime.parse(dateStr);
      return "${date.day}/${date.month}/${date.year}";
    } catch (e) {
      return dateStr;
    }
  }
}
