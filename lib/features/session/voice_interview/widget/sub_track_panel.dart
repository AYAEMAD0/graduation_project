import 'package:flutter/material.dart';

import '../../../../core/theme/app_style.dart';

class SubTrackPanel extends StatelessWidget {
  final Map<String, dynamic> trackData;
  final String? selectedSub;
  final ValueChanged<String> onSubSelected;

  const SubTrackPanel({
    super.key,
    required this.trackData,
    required this.selectedSub,
    required this.onSubSelected,
  });

  @override
  Widget build(BuildContext context) {
    final color = trackData['color'] as Color;
    final subs = trackData['subTracks'] as List<String>;
    final subIcons = trackData['subIcons'] as List<IconData>?;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xff15151B) : Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.05)
              : Colors.black.withValues(alpha: 0.07),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: isDark
                  ? color.withValues(alpha: 0.12)
                  : color.withValues(alpha: 0.08),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(13),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    trackData['icon'] as IconData,
                    color: color,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trackData['title'] as String,
                      style: AppStyle.font16BlackSemiBold.copyWith(
                        color: color,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Choose a specialization',
                      style: AppStyle.font16BlackSemiBold.copyWith(
                        fontSize: 11,
                        color: isDark ? Colors.grey.shade400 : Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 4,
              ),
              itemCount: subs.length,
              itemBuilder: (context, i) {
                final isSel = selectedSub == subs[i];
                return GestureDetector(
                  onTap: () => onSubSelected(subs[i]),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    decoration: BoxDecoration(
                      color: isSel
                          ? color.withValues(alpha: isDark ? 0.2 : 0.1)
                          : (isDark
                                ? const Color(0xff22222A)
                                : Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isSel
                            ? color
                            : (isDark
                                  ? Colors.white.withValues(alpha: 0.05)
                                  : Colors.black.withValues(alpha: 0.08)),
                        width: isSel ? 1.5 : 0.5,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (subIcons != null) ...[
                          Icon(
                            subIcons[i],
                            size: 14,
                            color: isSel
                                ? color
                                : (isDark ? Colors.grey.shade500 : Colors.grey),
                          ),
                          const SizedBox(width: 6),
                        ],
                        Text(
                          subs[i],
                          style: AppStyle.font16BlackSemiBold.copyWith(
                            fontSize: 12,
                            color: isSel
                                ? color
                                : (isDark ? Colors.white : Colors.black87),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
