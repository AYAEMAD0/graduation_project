import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/constants/app_asset.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    if (isMobile) return const SizedBox.shrink();
    return Container(
      height: 60, //120
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColor.whiteColor.withValues(alpha: 0.3),
      ),
      child: Row(
        children: [
          Image.asset(AppAsset.logoAppImage, height: 80, width: 110),
          const SizedBox(width: 10),
          Text(
            "MockMate.ai",
            overflow: TextOverflow.ellipsis,
            style: AppStyle.font45BlackBoldRounded.copyWith(fontSize: 24), //50
          ),
        ],
      ),
    );
  }
}
