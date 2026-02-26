import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';

class OptionItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const OptionItem({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Icon(
                isSelected
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                key: ValueKey(isSelected),
                size: 20,
                color:AppColor.purpleDarkColor,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              text,
              style: const TextStyle(fontSize: 16, color: AppColor.blackColor),
            ),
          ],
        ),
      ),
    );
  }
}
