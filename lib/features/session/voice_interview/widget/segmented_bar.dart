import 'package:flutter/material.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_style.dart';

class SegmentedBar extends StatelessWidget {
  final List<Map<String, dynamic>> tracks;
  final String? activeMain;
  final ValueChanged<String> onTap;

  const SegmentedBar({
    super.key,
    required this.tracks,
    required this.activeMain,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColor.grayLightColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.black.withValues(alpha: 0.06)),
      ),
      child: Row(
        children: tracks.map((t) {
          final isActive = activeMain == t['title'];
          final color = t['color'] as Color;
          return Expanded(
            child: GestureDetector(
              onTap: () => onTap(t['title'] as String),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: isActive ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: isActive
                      ? Border.all(color: color.withValues(alpha: 0.3))
                      : null,
                ),
                child: Column(
                  children: [
                    Icon(
                      t['icon'] as IconData,
                      size: 20,
                      color: isActive ? color : Colors.black,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      t['title'] as String,
                      style: AppStyle.font16BlackSemiBold.copyWith(
                        fontSize: 11,
                        color: isActive ? color : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
