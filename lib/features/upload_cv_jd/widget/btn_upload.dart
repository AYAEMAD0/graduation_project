import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../core/constants/app_asset.dart';
import '../../../core/theme/app_gradient.dart';
import '../../../core/theme/app_style.dart';

class BtnUpload extends StatelessWidget {
  const BtnUpload({super.key, required this.text, required this.onTap});

  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: EdgeInsets.symmetric(
          vertical: isMobile ? 18 : 20,
          horizontal: isMobile ? 14 : 40,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(57),
          gradient: AppGradient.primaryGradient,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Text(
                text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyle.font31WhiteSemiBold
                    .copyWith(fontSize: isMobile ? 18 : 31),
              ),
            ),
            const SizedBox(width: 10),
            SvgPicture.asset(
              AppAsset.uploadIcon,
              width: isMobile ? 33 : 55,
            ),
          ],
        ),
      ),
    );
  }
}
