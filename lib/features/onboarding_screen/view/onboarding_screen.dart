import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import '../../../core/config/di.dart';
import '../widget/gradient_dot_indicator.dart';
import '../viewmodel/onboarding_cubit.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<OnboardingCubit>(); // DI instance

    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<OnboardingCubit, int>(
        builder: (context, currentPage) {
          final pages = cubit.pages;

          return Scaffold(
            backgroundColor: AppColor.whiteColor,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              child: Column(
                children: [
                  // PageView
                  Expanded(
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: pages.length,
                      onPageChanged: (index) => cubit.setPage(index),
                      itemBuilder: (context, index) {
                        final page = pages[index];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              page.title,
                              style: AppStyle.font34BlackSemiBold,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 20.h),
                            Image.asset(
                              page.image,
                              height: 320.h,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 20.h),
                            Text(
                              page.description,
                              style: AppStyle.font27BlackLight,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
                      },
                    ),
                  ),

                  // Dots
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      pages.length,
                          (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: GestureDetector(
                          onTap: () {
                            _controller.animateToPage(
                              index,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                            cubit.setPage(index);
                          },
                          child: GradientDotIndicator(
                            isActive: currentPage == index,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 50.h),

                  // Buttons
                  Row(
                    spacing: 45.w,
                    children: [
                      Spacer(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primaryPurpleColor,
                          foregroundColor: AppColor.whiteColor,
                          padding: EdgeInsets.symmetric(
                            horizontal: 45.w,
                            vertical: 20.h,
                          ),
                        ),
                        onPressed: () {
                          _controller.jumpToPage(pages.length - 1);
                          cubit.skip();
                        },
                        child: Text("SKIP", style: AppStyle.font16WhiteBold),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primaryPurpleColor,
                          foregroundColor: AppColor.whiteColor,
                          padding: EdgeInsets.symmetric(
                            horizontal: 45.w,
                            vertical: 20.h,
                          ),
                        ),
                        onPressed: () {
                          if (currentPage == pages.length - 1) {
                            Navigator.pushReplacementNamed(context, '/home');
                          } else {
                            _controller.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                            cubit.nextPage();
                          }
                        },
                        child: Text("NEXT", style: AppStyle.font16WhiteBold),
                      ),
                      Spacer(),
                    ],
                  ),

                  SizedBox(height: 50.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
