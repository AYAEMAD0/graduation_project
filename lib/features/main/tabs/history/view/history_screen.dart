import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_mate_ai/core/config/di.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/features/main/tabs/history/viewModel/history_cubit.dart';
import 'package:mock_mate_ai/features/main/tabs/history/widget/main_background.dart';
import '../widget/history_listView.dart';

class HistoryTap extends StatelessWidget {
  const HistoryTap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> getIt<HistoryCubit>()..fetchHistory(),
      child: MainBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text("Recent Interviews", style: AppStyle.font32BlackBold),
              const SizedBox(height: 30),
              const Expanded(
                child: HistoryListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}