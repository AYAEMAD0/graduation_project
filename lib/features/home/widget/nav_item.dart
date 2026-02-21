import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';

class NavItem extends StatelessWidget {
  final String title;
  final int index;
  final int currentIndex;
  final VoidCallback onTap;
  const NavItem({
    super.key,
    required this.title,
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
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: AppStyle.font34RoundedBold),
            const SizedBox(height: 6),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 3,
              width: isActive ? 40 : 0,
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
