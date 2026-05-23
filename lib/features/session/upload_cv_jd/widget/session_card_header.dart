import 'package:flutter/material.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_style.dart';

class SessionCardHeader extends StatelessWidget {
  const SessionCardHeader({super.key, required this.isMobile});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      children: [
        Icon(
          Icons.rocket_launch,
          size: isMobile ? 25 : 30,
          color: AppColor.purple,
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            "Start New Session",
            overflow: TextOverflow.ellipsis,
            style:
                (isMobile
                        ? AppStyle.font20BlackSemiBold
                        : AppStyle.font24BlackBold)
                    .copyWith(color: isDark ? Colors.white : Colors.black),
          ),
        ),
      ],
    );
  }
}
