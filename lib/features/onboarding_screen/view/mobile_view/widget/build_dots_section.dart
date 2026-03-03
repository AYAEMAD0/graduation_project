import 'package:flutter/material.dart';

import '../../../viewmodel/onboarding_cubit.dart';
import 'gradient_dot_indicator.dart';

class BuildDotsSection extends StatelessWidget {
  const BuildDotsSection({
    super.key,
    required this.currentPage,
    required this.controller,
    required this.cubit,
    required this.length,
  });

  final int currentPage;
  final PageController controller;
  final OnboardingCubit cubit;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: GestureDetector(
            onTap: () {
              controller.animateToPage(
                index,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              cubit.setPage(index);
            },
            child: GradientDotIndicator(isActive: currentPage == index),
          ),
        ),
      ),
    );
  }
}
