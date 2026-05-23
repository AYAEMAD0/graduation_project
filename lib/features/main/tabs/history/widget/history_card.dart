import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';

import '../../../../../core/helper/format_date.dart';
import '../../../../../domain/entities/history/history_entity.dart';

class HistoryCard extends StatelessWidget {
  final int notifications;
  final Color scoreColor;
  final DataEntity data;

  const HistoryCard({
    super.key,
    required this.data,
    required this.notifications,
    required this.scoreColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: isDark
            ? Theme.of(context).cardColor
            : AppColor.whiteColor.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.05)
              : AppColor.whiteColor,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.3)
                : Colors.black.withValues(alpha: 0.08),
            blurRadius: 20,
            spreadRadius: 2,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: isDark
                        ? const Color(0xff1E293B)
                        : const Color(0xFFE8F0FE),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    Icons.mic,
                    color: isDark
                        ? const Color(0xff60A5FA)
                        : AppColor.primaryBlueColor,
                    size: 26,
                  ),
                ),
                if (notifications > 0)
                  Positioned(
                    top: -2,
                    right: -2,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: AppColor.red,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isDark ? Colors.grey.shade900 : Colors.white,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        "$notifications",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.trackName ?? "Unknown",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: isDark ? Colors.white : AppColor.slateDark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Mock Mate AI"
                    "   • ${data.seniorityLevel ?? ""}"
                    "   • ${data.interviewType ?? ""}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isDark ? Colors.grey.shade400 : AppColor.slateGray,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${data.score}%",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    color: scoreColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  FormatDate.formatDate(data.startDate ?? ""),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: isDark
                        ? Colors.grey.shade500
                        : AppColor.grayMediumColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
