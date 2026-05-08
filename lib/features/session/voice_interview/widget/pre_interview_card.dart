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
    {'title': 'Backend', 'icon': Icons.storage_rounded, 'color': Colors.blue},
    {'title': 'Frontend', 'icon': Icons.web_rounded, 'color': Colors.orange},
    {
      'title': 'Mobile',
      'icon': Icons.smartphone_rounded,
      'color': Colors.green,
    },
    {'title': 'AI', 'icon': Icons.auto_awesome, 'color': Colors.purple},
  ];

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VoicePreInterviewCubit>();

    return BlocBuilder<VoicePreInterviewCubit, VoicePreInterviewState>(
      builder: (context, state) {
        return Center(
          child: Container(
            width: isMobile ? double.infinity : 1010,
            padding: EdgeInsets.all(isMobile ? 28 : 30),
            margin: EdgeInsets.symmetric(horizontal: isMobile ? 15 : 20),
            decoration: BoxDecoration(
              color: AppColor.whiteDarkColor,
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  color: AppColor.blackColor.withValues(alpha: 0.2),
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
                const SizedBox(height: 24),
                HardwareCheckSection(
                  isMicAllowed: state.isMicAllowed,
                  isCheckingMic: state.isCheckingMic,
                  isCameraAllowed: state.isCameraAllowed,
                  isCheckingCamera: state.isCheckingCamera,
                  onAllowMic: () => cubit.requestMicPermission(),
                  onAllowCamera: () => cubit.requestCameraPermission(),
                ),
                const SizedBox(height: 20),
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
