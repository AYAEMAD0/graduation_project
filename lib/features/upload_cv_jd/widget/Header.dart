import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mock_mate_ai/core/constants/app_asset.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(AppAsset.logoAppImage, height: 48),
            const SizedBox(width: 8),
            Text("MockMate.ai", style: AppStyle.font20BlackSemiBold),
          ],
        ),

        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 6),
            ],
          ),
          child: SvgPicture.asset(
            AppAsset.notifications,
            width: 22,
            height: 22,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
