import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../core/theme/app_color.dart';

class BuildDockAvatar extends StatelessWidget {
  final int index;
  final int currentIndex;
  final Function(int) onTap;
  final bool isWeb;

  const BuildDockAvatar({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.onTap,
    required this.isWeb,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = currentIndex == index;
    final bool isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        // padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected
                ? (isWeb ? const Color(0xA6A806F9) : AppColor.purple)
                : Colors.transparent,
            width: 3,
          ),
        ),
        child: CircleAvatar(
          radius: 20,
          backgroundColor: isSelected
              ? isWeb
                    ? AppColor.whiteColor
                    : AppColor.purple.withValues(alpha: 0.1)
              : isMobile
              ? AppColor.transparentColor
              : Colors.white,
          child: Icon(
            Icons.person,
            color: isSelected ? AppColor.purple : Colors.black,
            size: 22,
          ),
        ),
      ),
    );
  }
}
