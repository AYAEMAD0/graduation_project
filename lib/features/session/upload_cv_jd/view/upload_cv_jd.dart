import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_mate_ai/features/session/viewmodel/interview_session/ai_interview_cubit.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../core/config/di.dart';
import '../../../../core/helper/shared_check_helper.dart';
import '../../../../core/theme/app_color.dart';
import '../../viewmodel/interview_session/interview_session_cubit.dart';
import '../widget/greeting_section.dart';
import '../widget/header.dart';
import '../widget/start_session_card.dart';

class UploadCvJd extends StatelessWidget {
  const UploadCvJd({super.key});

  @override
  Widget build(BuildContext context) {
    final String mode = ModalRoute.of(context)?.settings.arguments as String? ?? 'db';
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final displayName =
        SharedCheckHelper.getValue(SharedCheckHelper.keyDisplayName) ?? "User";

    return Scaffold(
      backgroundColor: AppColor.whiteDarkColor,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<InterviewSessionCubit>()),
          BlocProvider(create: (context) => getIt<AiInterviewCubit>()),
        ],
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: isMobile ? -80 : 90,
                left: isMobile ? -120 : -100,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                  child: Container(
                    width: isMobile ? 400 : 800,
                    height: isMobile ? 300 : 700,
                    decoration: BoxDecoration(
                      color: AppColor.homeEffectBlue.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 620,
                left: -100,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 300, sigmaY: 100),
                  child: Container(
                    width: isMobile ? 300 : 600,
                    height: isMobile ? 300 : 600,
                    decoration: BoxDecoration(
                      color: Color(0xffE2ECF1).withValues(alpha: 0.90),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: -150,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 600, sigmaY: 400),
                  child: Container(
                    width: isMobile ? 300 : 1500,
                    height: isMobile ? 300 : 900,
                    decoration: BoxDecoration(
                      color: AppColor.grayColor.withValues(alpha: 0.18),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 450,
                right: -150,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                  child: Container(
                    width: isMobile ? 400 : 900,
                    height: isMobile ? 400 : 900,
                    decoration: BoxDecoration(
                      color: AppColor.purple.withValues(alpha: 0.16),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Header(),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 8 : 20,
                      ),
                      child: SingleChildScrollView(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        child: Center(
                          child: Container(
                            constraints: const BoxConstraints(maxWidth: 1200),
                            padding: EdgeInsets.only(
                              top: isMobile ? 20 : 50,
                              bottom: 40,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GreetingSection(displayName: displayName),
                                SizedBox(height: isMobile ? 30 : 60),
                                StartSessionCard(mode: mode),
                                SizedBox(height: 25),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
