import 'package:flutter/material.dart';
import '../../../core/theme/app_color.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final double width = 72;
    final double height = 30;
    final double circleWidth = 30;
    final double circleHeight = 27;

    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              left: value ? width - circleWidth - 3 : 3,
              top: (height - circleHeight) / 2,
              child: Container(
                width: circleWidth,
                height: circleHeight,
                decoration: BoxDecoration(
                  color: value
                      ? AppColor.purpleDarkColor
                      : AppColor.blueLightSwitch,
                  borderRadius: BorderRadius.circular(circleHeight / 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}