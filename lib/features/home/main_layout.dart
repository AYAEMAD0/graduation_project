import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/features/home/taps/faq_tap.dart';
import 'package:mock_mate_ai/features/home/taps/history_tap.dart';
import 'package:mock_mate_ai/features/home/taps/home_tap.dart';
import 'package:mock_mate_ai/features/home/taps/profile_tap.dart';
import 'package:mock_mate_ai/features/home/widget/Navbar.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;


  final List<Widget> pages = const [
    HomeTap(),
    HistoryTap(),
    FaqTap(),
    ProfileTap(),
  ];

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Scaffold(
      extendBody: true, 
      body: Stack(
        children: [
          Column(
            children: [
              if (!isMobile)
                Navbar(
                
                  currentIndex: currentIndex > 2 ? 0 : currentIndex,
                  onTap: (index) => setState(() => currentIndex = index),
                ),
              
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
          
                  child: pages[currentIndex],
                ),
              ),
            ],
          ),
          
          if (isMobile) _buildMobileDock(),
        ],
      ),
    );
  }

  Widget _buildMobileDock() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(bottom: 25, left: 20, right: 20),
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
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
              color: Colors.white.withOpacity(0.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildDockItem(0, Icons.home_rounded, "Home"),
                  _buildDockItem(1, Icons.history_rounded, "History"),
                  _buildDockItem(2, Icons.help_outline_rounded, "FAQ"),
                  _buildDockAvatar(3), 
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDockItem(int index, IconData icon, String label) {
    bool isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => currentIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.purple.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? AppColor.purple : Colors.grey[600],
              size: 26,
            ),
            if (isSelected)
              Text(
                label,
                style: TextStyle(
                  color: AppColor.purple,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDockAvatar(int index) {
    bool isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => currentIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? AppColor.purple : Colors.transparent,
            width: 2,
          ),
        ),
        child: CircleAvatar(
          radius: 18,
          backgroundColor: isSelected ? AppColor.purple.withOpacity(0.1) : Colors.white,
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