import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_mate_ai/features/main/tabs/history/view/history_screen.dart';
import 'package:mock_mate_ai/features/main/widget/navbar.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../core/helper/shared_check_helper.dart';
import 'tabs/faq/faq_tab.dart';
import 'tabs/home/home_tab.dart';
import 'tabs/profile/view/profile_tab.dart';
import 'tabs/profile/viewmodel/profile/profile_cubit.dart';
import 'widget/build_mobile_dock.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;
  bool _isNavbarVisible = true;
  double lastScrollOffset = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userId = SharedCheckHelper.getValue(SharedCheckHelper.keyUserId);
      context.read<ProfileCubit>().getProfile(userId);
    });
  }

  final List<Widget> pages = const [
    HomeTab(),
    HistoryTap(),
    FaqTab(),
    ProfileTab(),
  ];

  bool _onScrollNotification(ScrollNotification notification) {
    if (currentIndex != 0) return false;
    if (notification is ScrollUpdateNotification) {
      final delta = notification.scrollDelta ?? 0;
      final currentOffset = notification.metrics.pixels;
      if (currentOffset <= 0) {
        if (!_isNavbarVisible) setState(() => _isNavbarVisible = true);
      } else if (delta > 3 && _isNavbarVisible) {
        setState(() => _isNavbarVisible = false);
      } else if (delta < -3 && !_isNavbarVisible) {
        setState(() => _isNavbarVisible = true);
      }
      lastScrollOffset = currentOffset;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Column(
            children: [
              if (!isMobile && _isNavbarVisible)
                Navbar(
                  currentIndex: currentIndex,
                  onTap: (index) => setState(() => currentIndex = index),
                ),
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: _onScrollNotification,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    transitionBuilder: (Widget child,
                        Animation<double> animation) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    child: pages[currentIndex],
                  ),
                ),
              ),
            ],
          ),
          if (isMobile)
            BuildMobileDock(
              currentIndex: currentIndex,
              onTap: (index) => setState(() => currentIndex = index),
            ),
        ],
      ),
    );
  }
}