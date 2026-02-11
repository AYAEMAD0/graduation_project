import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_mate_ai/core/helper/shared_check_helper.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';
import '../../../core/config/di.dart';
import '../../../core/routes/app_routes.dart';
import '../viewmodel/onboarding_cubit.dart';
import '../widget/onboarding_section.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<OnboardingCubit>();
    final pages = cubit.pages;

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        child: Center(
          child: Column(
            children: [
              // Section 1
              OnboardingSection(
                title: pages[0].title,
                image: pages[0].image,
                description: pages[0].description,
              ),

              SizedBox(height: 180.h),

              // Section 2
              OnboardingSection(
                title: pages[1].title,
                image: pages[1].image,
                description: pages[1].description,
              ),

              SizedBox(height: 180.h),

              // Section 3
              OnboardingSection(
                title: pages[2].title,
                image: pages[2].image,
                description: pages[2].description,
              ),

              SizedBox(height: 100.h),

              // Next Button
              CustomButton(
                text: "NEXT",
                onPressed: () {
                  SharedCheckHelper.setValue(
                    SharedCheckHelper.keyIsOnBoarding,
                    true,
                  );
                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.login,
                  );
                },
              ),

              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
