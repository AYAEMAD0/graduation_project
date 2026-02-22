import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:mock_mate_ai/features/main/widget/navbar.dart';
import 'tabs/faq/faq_tab.dart';
import 'tabs/history/history_tab.dart';
import 'tabs/home/home_tab.dart';
import 'tabs/profile/profile_tab.dart';
import 'widget/build_mobile_dock.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomeTab(),
    HistoryTab(),
    FaqTab(),
    ProfileTab(),
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
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                  child: pages[currentIndex],
                ),
              ),
            ],
          ),
          if (isMobile)
            BuildMobileDock(
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              }
            ),
        ],
      ),
    );
  }
}
