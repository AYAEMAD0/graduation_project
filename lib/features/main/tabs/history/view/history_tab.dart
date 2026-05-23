import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // ✅ ضفنا الـ import ده
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/core/widget/main_background.dart';

import '../viewModel/history_cubit.dart'; // ✅ ضفنا الـ import بتاع الكيوبيت
import '../widget/history_listview.dart';

class HistoryTab extends StatefulWidget {
  const HistoryTab({super.key});

  @override
  State<HistoryTab> createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {

  @override
  void initState() {
    super.initState();
    context.read<HistoryCubit>().fetchHistory();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        height: double.infinity,
        child: MainBackground(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text("Recent Interviews", style: AppStyle.font32BlackBold.copyWith(
                  color: isDark ? Colors.white : Colors.black,
                )),
                const SizedBox(height: 30),
                const Expanded(child: HistoryListView()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}