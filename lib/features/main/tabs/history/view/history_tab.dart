import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/core/widget/main_background.dart';

import '../widget/history_listview.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Text("Recent Interviews", style: AppStyle.font32BlackBold),
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
