import 'dart:ui';
import 'package:flutter/material.dart';
import 'build_dock_item.dart';

class BuildMobileDock extends StatelessWidget {
  const BuildMobileDock({super.key, required this.currentIndex, required this.onTap});
  final int currentIndex;
  final Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(bottom: 25, left: 20, right: 20),
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              color: Colors.white.withValues(alpha: 0.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BuildDockItem(
                    index: 0,
                    icon: Icons.home_outlined,
                    label: "Home",
                    currentIndex: currentIndex,
                    onTap: onTap,
                  ),
                  BuildDockItem(
                    index: 1,
                    icon: Icons.history_rounded,
                    label: "History",
                    currentIndex: currentIndex,
                    onTap: onTap,
                  ),
                  BuildDockItem(
                    index: 2,
                    icon: Icons.help_outline_rounded,
                    label: "FAQ",
                    currentIndex: currentIndex,
                    onTap: onTap,
                  ),

                  BuildDockItem(
                    index: 3,
                    icon: Icons.person_outline_sharp,
                    label: "Profile",
                    currentIndex: currentIndex,
                    onTap: onTap,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
