import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../viewmodel/voice_interview_cubit.dart';
import '../viewmodel/voice_interview_state.dart';
import 'build_control_bar.dart';
import 'build_evaluating_overlay.dart';
import 'build_timer_badge.dart';
import 'voice_interview_panels.dart';

class VoiceInterviewBody extends StatelessWidget {
  final String track;
  final bool isCameraInitialized;
  final CameraController? cameraController;
  final VoidCallback onStart;
  final VoidCallback onEnd;

  const VoiceInterviewBody({
    super.key,
    required this.track,
    required this.isCameraInitialized,
    required this.cameraController,
    required this.onStart,
    required this.onEnd,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VoiceInterviewCubit>();

    return BlocBuilder<VoiceInterviewCubit, VoiceInterviewState>(
      builder: (context, state) {
        if (state.isEvaluating) return const EvaluatingOverlay();

        return Column(
          children: [
            if (state.isConnected)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TimerBadge(remainingSeconds: state.remainingSeconds),
              ),
            Expanded(
              child: VoiceInterviewPanels(
                state: state,
                isCameraInitialized: isCameraInitialized,
                cameraController: cameraController,
              ),
            ),
            ControlBar(
              state: state,
              onStart: onStart,
              onToggleMic: () => state.isListening
                  ? cubit.stopListening()
                  : cubit.startListening(),
              onEnd: onEnd,
            ),
          ],
        );
      },
    );
  }
}
