import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';

class MainBackground extends StatelessWidget {
  final Widget child;
  const MainBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: IgnorePointer(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: isMobile ? -80 : -60,
                    left: isMobile ? -120 : -300,
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                      child: Container(
                        width: isMobile ? 400 : 800,
                        height: isMobile ? 500 : 700,
                        decoration: BoxDecoration(
                          color: AppColor.homeEffectBlue.withOpacity(0.15),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: -100,
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 300, sigmaY: 100),
                      child: Container(
                        width: isMobile ? 300 : 600,
                        height: isMobile ? 300 : 600,
                        decoration: BoxDecoration(
                          color: const Color(0xffE2ECF1).withOpacity(0.90),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: -150,
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                      child: Container(
                        width: isMobile ? 400 : 900,
                        height: isMobile ? 400 : 900,
                        decoration: BoxDecoration(
                          color: AppColor.purple.withOpacity(0.16),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(child: child),
        ],
      ),
    );
  }
}
