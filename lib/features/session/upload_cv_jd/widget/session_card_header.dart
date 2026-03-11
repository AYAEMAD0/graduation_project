import 'package:flutter/material.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_style.dart';

class SessionCardHeader extends StatelessWidget {
  const SessionCardHeader({super.key, required this.isMobile});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.rocket_launch,
          size: isMobile ? 25 : 60,
          color: AppColor.purple,
        ),
        SizedBox(width: isMobile ? 12 : 22),
        Flexible(
          child: Text(
            "Start New Session",
            overflow: TextOverflow.ellipsis,
            style: isMobile
                ? AppStyle.font20BlackSemiBold
                : AppStyle.font24BlackBold.copyWith(fontSize: 40),
          ),
        ),
      ],
    );
  }
}
