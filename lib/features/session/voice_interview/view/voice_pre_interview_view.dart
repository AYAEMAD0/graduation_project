import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../core/theme/app_color.dart';
import '../../upload_cv_jd/widget/header.dart';
import '../viewmodel/voice_pre_interview_cubit.dart';
import '../widget/pre_interview_card.dart';

class VoicePreInterviewView extends StatelessWidget {
  const VoicePreInterviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VoicePreInterviewCubit(),
      child: const _VoicePreInterviewView(),
    );
  }
}

class _VoicePreInterviewView extends StatelessWidget {
  const _VoicePreInterviewView();

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Scaffold(
      body: SafeArea(
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
                    child: Center(
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 1200),
                        padding: EdgeInsets.only(
                          top: 15,
                          bottom: 15,
                        ),
                        child: PreInterviewCard(isMobile: isMobile),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
