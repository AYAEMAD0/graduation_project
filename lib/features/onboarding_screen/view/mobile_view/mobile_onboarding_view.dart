import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';
import '../../../../core/config/di.dart';
import '../../../../core/routes/app_routes.dart';
import '../../viewmodel/onboarding_cubit.dart';
import 'widget/gradient_dot_indicator.dart';

class MobileOnboardingView extends StatelessWidget {
  MobileOnboardingView({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<OnboardingCubit>();
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<OnboardingCubit, int>(
        builder: (context, currentPage) {
          final pages = cubit.pages;
          return SafeArea(
            child: Scaffold(
              backgroundColor: AppColor.whiteColor,
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
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
                          return SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  page.title,
                                  style: AppStyle.font34BlackSemiBold,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 6),
                                Image.asset(
                                  page.image,
                                  height: 240,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  page.description,
                                  style: AppStyle.font25BlackLight,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 15),

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
                    SizedBox(height: 50),
                    // Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButton(
                          text: "SKIP",
                          widthBtn: 130,
                          onPressed: () {
                            _controller.jumpToPage(pages.length - 1);
                            cubit.skip();
                          },
                        ),
                        CustomButton(
                          text: "NEXT",
                          widthBtn: 130,
                          onPressed: () {
                            if (currentPage == pages.length - 1) {
                             Navigator.pushReplacementNamed(context,AppRoutes.login);
                            } else {
                              _controller.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                              cubit.nextPage();
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
