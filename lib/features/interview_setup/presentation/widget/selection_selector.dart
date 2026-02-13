import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_gradient.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SelectionSelector extends StatelessWidget {
  final List<String> items;
  final int selectedIndex;
  final Function(int) onTap;

  const SelectionSelector({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    final double verticalPadding = isMobile ? 14 : 16;
    final double fontSize = isMobile ? 16 : 18;
    final double borderRadius = isMobile ? 18 : 24;
    final double containerWidth = isMobile ? double.infinity : 800;

    return Center(
      child: Container(
        width: containerWidth,
        decoration: BoxDecoration(
          color: AppColor.whiteDarkColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Row(
          children: List.generate(
            items.length,
                (index) => Expanded(
              child: GestureDetector(
                onTap: () => onTap(index),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: verticalPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    gradient: selectedIndex == index
                        ? AppGradient.primaryGradient
                        : null,
                  ),
                  child: Center(
                    child: Text(
                      items[index],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        color: selectedIndex == index
                            ? AppColor.whiteColor
                            : AppColor.blackColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
