import 'package:flutter/material.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_style.dart';

class BuildAvailableTracks extends StatelessWidget {
  const BuildAvailableTracks({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AppColor.purple.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, size: 16, color: AppColor.purple),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              "Available pathways: Backend, Frontend, Full Stack, Mobile Applications, AI & ML, Cybersecurity. Otherwise, it would be General Software.",
              style: AppStyle.font15GrayDarkRegular.copyWith(
                color: isDark ? Colors.white : Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
