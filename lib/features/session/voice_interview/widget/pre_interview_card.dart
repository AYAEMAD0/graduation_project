import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_mate_ai/core/routes/app_routes.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';

import '../viewmodel/voice_pre_interview_cubit.dart';
import '../viewmodel/voice_pre_interview_state.dart';
import 'hardware_check_section.dart';
import 'proceed_button.dart';
import 'track_selection_section.dart';

class PreInterviewCard extends StatelessWidget {
  final bool isMobile;

  const PreInterviewCard({super.key, required this.isMobile});

  static const List<Map<String, dynamic>> _tracks = [
    {
      'title': 'Web',
      'icon': Icons.web_rounded,
      'color': Colors.blue,
      'subTracks': ['Frontend', 'Backend', 'Full Stack'],
    },
    {
      'title': 'Mobile',
      'icon': Icons.smartphone_rounded,
      'color': Colors.green,
      'subTracks': ['Android', 'iOS', 'Flutter'],
    },
    {
      'title': 'AI',
      'icon': Icons.auto_awesome_rounded,
      'color': Colors.purple,
      'subTracks': [
        'Machine Learning',
        'Deep Learning',
        'NLP',
        'Computer Vision',
      ],
    },
    {
      'title': 'Infra',
      'icon': Icons.cloud_rounded,
      'color': Colors.orange,
      'subTracks': ['Cloud', 'Networking', 'Cyber Security', 'DevOps'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VoicePreInterviewCubit>();
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocBuilder<VoicePreInterviewCubit, VoicePreInterviewState>(
      builder: (context, state) {
        return Center(
          child: Container(
            width: isMobile ? double.infinity : 1010,
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 15,
              right: 20,
              left: 20,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: isDark
                  ? Theme.of(context).cardColor
                  : AppColor.whiteDarkColor,
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  color: isDark
                      ? Colors.black.withValues(alpha: 0.4)
                      : AppColor.blackColor.withValues(alpha: 0.2),
                  blurRadius: 60,
                  offset: const Offset(0, 25),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TrackSelectionSection(
                  tracks: _tracks,
                  selectedTrack: state.selectedTrack,
                  onTrackSelected: cubit.selectTrack,
                ),
                const SizedBox(height: 12),
                HardwareCheckSection(
                  isMicAllowed: state.isMicAllowed,
                  isCheckingMic: state.isCheckingMic,
                  isCameraAllowed: state.isCameraAllowed,
                  isCheckingCamera: state.isCheckingCamera,
                  onAllowMic: () => cubit.requestMicPermission(),
                  onAllowCamera: () => cubit.requestCameraPermission(),
                ),
                const SizedBox(height: 15),
                ProceedButton(
                  isEnabled: state.canProceed,
                  onPressed: () => Navigator.pushNamed(
                    context,
                    AppRoutes.voiceInterview,
                    arguments: state.selectedTrack,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
