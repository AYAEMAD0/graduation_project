import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:mock_mate_ai/core/theme/app_gradient.dart';
import 'package:mock_mate_ai/features/upload_cv_jd/widget/GreetingSection.dart';
import 'package:mock_mate_ai/features/upload_cv_jd/widget/Header.dart';
import 'package:mock_mate_ai/features/upload_cv_jd/widget/StartSessionCard.dart';

class UploadCvJd extends StatelessWidget {
  const UploadCvJd({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;
    final isDesktop = ResponsiveBreakpoints.of(context).isDesktop;

    return Scaffold(
      body: Column(
        children: [

          /// HEADER ثابت
          Container(
            width: double.infinity,
            color: Colors.white,
            child: SafeArea(
              bottom: false,
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 900),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: const Header(),
                ),
              ),
            ),
          ),

          /// BODY SCROLLABLE
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: AppGradient.gradientUploadCvJd,
              ),
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                ScrollViewKeyboardDismissBehavior.onDrag,
                child: Center(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 900),
                    padding: const EdgeInsets.only(
                      top: 60,
                      bottom: 40,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        GreetingSection(),
                        SizedBox(height: 120),
                        StartSessionCard(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}