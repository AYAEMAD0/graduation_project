import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';

class NavItem extends StatelessWidget {
  final String? title;
  final Widget? icon;
  final int index;
  final int currentIndex;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    this.title,
    this.icon,
    required this.index,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = index == currentIndex;

    return GestureDetector(
      onTap: isActive ? null : onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 8,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (title != null)
              Text(title!, style: AppStyle.font34RoundedBold)
            else if (icon != null)
              icon!,
            SizedBox(height: 7),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: 3,
              width: isActive ? 55 : 0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
