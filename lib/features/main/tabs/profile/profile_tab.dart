import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../core/theme/app_color.dart';
import 'widget/build_profile_card.dart';
import 'widget/build_person_info_section.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoints = ResponsiveBreakpoints.of(context);
    final isMobile = breakpoints.isMobile;

    return Scaffold(
      backgroundColor: AppColor.homeBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -150,
                left: -100,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                  child: Container(
                    width: isMobile?350:700,
                    height: isMobile?350:600,
                    decoration: BoxDecoration(
                      color: AppColor.homeEffectBlue.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 220,
                right: -150,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                  child: Container(
                    width: isMobile?350:800,
                    height:isMobile?350:800,
                    decoration: BoxDecoration(
                      color: AppColor.purple.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 20 : 40,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: isMobile ? 20 : 70),

                        /// PROFILE CARD
                        BuildProfileCard(),
                        const SizedBox(height: 30),
                        BuildPersonInfoSection(),
                        const SizedBox(height: 30),

                        /// LOGOUT BUTTON
                        CustomButton(
                          widthBtn: isMobile ? 250 : 600,
                          onPressed: () {},
                          text: "Logout",
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
