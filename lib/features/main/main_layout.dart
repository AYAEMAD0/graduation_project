import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_mate_ai/features/main/tabs/history/view/history_tab.dart';
import 'package:mock_mate_ai/features/main/widget/navbar.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:mock_mate_ai/core/theme/theme_extensions.dart';

import '../../core/helper/shared_check_helper.dart';
import 'tabs/faq/view/faq_tab.dart';
import 'tabs/home/home_tab.dart';
import 'tabs/profile/view/profile_tab.dart';
import 'tabs/profile/viewmodel/profile/profile_cubit.dart';
import 'widget/build_mobile_dock.dart';

class MainLayout extends StatefulWidget {
  final int initialIndex;
  const MainLayout({super.key, this.initialIndex = 0});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  // شيلنا الـ late وخليناها متغير عادي بياخد الـ initialIndex فوراً
  int currentIndex = 0;
  bool _isNavbarVisible = true;
  double lastScrollOffset = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userId = SharedCheckHelper.getValue(SharedCheckHelper.keyUserId);
      context.read<ProfileCubit>().getProfile(userId);
    });
  }

  // 🛠️ التعديل الجوهري: لو حصل ريبيلد للأبلكيشن بسبب الثيم، بنجبر الـ Layout يثبت على الـ index الحالي اللي المستخدم واقف عليه وميرجعش للهوم
  @override
  void didUpdateWidget(covariant MainLayout oldWidget) {
    super.didUpdateWidget(oldWidget);
    // لو الـ initialIndex اتغير فعلياً من برا (توجيه حقيقي)، بنغيره.
    // غير كده بنحتفظ بالـ currentIndex الحالي جوه الـ state.
    if (widget.initialIndex != oldWidget.initialIndex && widget.initialIndex != currentIndex) {
      setState(() {
        currentIndex = widget.initialIndex;
      });
    }
  }

  final List<Widget> pages = const [
    HomeTab(),
    HistoryTab(),
    FaqTab(),
    ProfileTab(),
  ];

  void _changeTab(int index) {
    setState(() {
      currentIndex = index;
    });
  }

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
      backgroundColor: context.isDark
          ? Theme.of(context).scaffoldBackgroundColor
          : Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              if (!isMobile && _isNavbarVisible)
                Navbar(
                  currentIndex: currentIndex,
                  onTap: _changeTab,
                ),
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: _onScrollNotification,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    // استخدام الـ ValueKey هنا بيجبر فلاتر يحتفظ بحالة الصفحة الحالية أثناء تغيير الثيم
                    child: KeyedSubtree(
                      key: ValueKey<int>(currentIndex),
                      child: pages[currentIndex],
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (isMobile)
            BuildMobileDock(
              currentIndex: currentIndex,
              onTap: _changeTab,
            ),
        ],
      ),
    );
  }
}