import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/routes/app_routes.dart';
import '../viewModel/history_cubit.dart';
import '../viewModel/history_state.dart';
import 'build_load_more_btn.dart';
import 'history_card.dart';

class HistoryListView extends StatelessWidget {
  const HistoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (context, state) {
        if (state is HistoryLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xffA855F7)),
          );
        } else if (state is HistoryEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xffA855F7).withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.history_rounded,
                    size: 48,
                    color: Color(0xffA855F7),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "No Interviews Yet",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffA855F7),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Start your first interview\nand track your progress here",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade500,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          );
        } else if (state is HistorySuccess) {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: state.items.length + (state.hasMore ? 1 : 0),
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              if (index == state.items.length) {
                return BuildLoadMoreBtn(
                  isLoading: state.isLoadingMore,
                  onTap: () => context.read<HistoryCubit>().loadMore(),
                );
              }
              final interview = state.items[index];
              final score = interview.score ?? 0;
              final scoreColor = score == 0
                  ? Colors.red
                  : score <= 50
                  ? Colors.orange
                  : score <= 75
                  ? Colors.green
                  : const Color(0xffA855F7);

              return GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  AppRoutes.feedback,
                  arguments: interview.interviewSessionId,
                ),
                child: HistoryCard(
                  data: interview,
                  notifications: 0,
                  scoreColor: scoreColor,
                ),
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
}

