import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../viewmodel/voice_interview_state.dart';
import '../widget/build_ai_panel.dart';
import '../widget/build_user_panel.dart';

class VoiceInterviewPanels extends StatelessWidget {
  final VoiceInterviewState state;
  final bool isCameraInitialized;
  final CameraController? cameraController;

  const VoiceInterviewPanels({
    super.key,
    required this.state,
    required this.isCameraInitialized,
    required this.cameraController,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 800;
        final aiPanel = AiPanel(state: state);
        final userPanel = UserPanel(
          isListening: state.isListening,
          isCameraInitialized: isCameraInitialized,
          cameraController: cameraController,
        );

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: isDesktop
              ? Row(
                  children: [
                    Expanded(child: aiPanel),
                    const SizedBox(width: 24),
                    Expanded(child: userPanel),
                  ],
                )
              : Column(
                  children: [
                    Expanded(child: aiPanel),
                    const SizedBox(height: 16),
                    Expanded(child: userPanel),
                  ],
                ),
        );
      },
    );
  }
}
