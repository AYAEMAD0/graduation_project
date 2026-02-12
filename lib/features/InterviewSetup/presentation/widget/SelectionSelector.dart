import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
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
    double verticalPadding = ResponsiveValue<double>(
      context,
      defaultValue: 14,
      conditionalValues: const [
        Condition.smallerThan(name: MOBILE, value: 10),
        Condition.largerThan(name: TABLET, value: 16),
      ],
    ).value!;

    double fontSize = ResponsiveValue<double>(
      context,
      defaultValue: 14,
      conditionalValues: const [
        Condition.smallerThan(name: MOBILE, value: 12),
        Condition.largerThan(name: TABLET, value: 16),
      ],
    ).value!;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColor.grayMediumColor,
        borderRadius: BorderRadius.circular(30),
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
                  borderRadius: BorderRadius.circular(26),
                  gradient: selectedIndex == index
                      ? const LinearGradient(
                          colors: [Color(0xff7B8CFF), Color(0xffB36DFF)],
                        )
                      : null,
                ),
                child: Center(
                  child: Text(
                    items[index],
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      color: selectedIndex == index
                          ? Colors.white
                          : Colors.black87,
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
