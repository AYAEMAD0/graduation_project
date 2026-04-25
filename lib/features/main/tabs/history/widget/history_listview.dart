import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/routes/app_routes.dart';
import '../viewModel/history_cubit.dart';
import '../viewModel/history_state.dart';
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
          return const Center(
            child: Text("No Interviews Found", style: TextStyle(fontSize: 25)),
          );
        } else if (state is HistorySuccess) {
          final interviews = state.historyEntity.data!;
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            itemCount: interviews.length,
            itemBuilder: (context, index) {
              final interview = interviews[index];

              Color scoreColor = () {
                final score = interview.score ?? 0;
                if (score == 0) return Colors.red;
                if (score <= 50) return Colors.orange;
                if (score <= 75) return Colors.green;
                return const Color(0xffA855F7);
              }();

              return GestureDetector(
                onTap: () {
                  //todo nav into feedback
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.feedback,
                    (route) => route.settings.name == AppRoutes.home,
                    arguments: interview.interviewSessionId,
                  );
                },
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
