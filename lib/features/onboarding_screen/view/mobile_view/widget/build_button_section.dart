import 'package:flutter/material.dart';

import '../../../../../core/helper/shared_check_helper.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/widget/custom_button.dart';
import '../../../viewmodel/onboarding_cubit.dart';

class BuildButtonSection extends StatelessWidget {
  const BuildButtonSection({
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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomButton(
          text: "SKIP",
          widthBtn: 130,
          onPressed: () {
            controller.jumpToPage(length - 1);
            cubit.skip();
          },
        ),
        CustomButton(
          text: "NEXT",
          widthBtn: 130,
          onPressed: () {
            if (currentPage == length - 1) {
              SharedCheckHelper.setValue(
                SharedCheckHelper.keyIsOnBoarding,
                true,
              );
              Navigator.pushReplacementNamed(context, AppRoutes.login);
            } else {
              controller.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              cubit.nextPage();
            }
          },
        ),
      ],
    );
  }
}
