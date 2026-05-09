import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';

import '../viewmodel/voice_interview_state.dart';

class AiPanel extends StatelessWidget {
  final VoiceInterviewState state;

  const AiPanel({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.blueDark,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: state.isAiSpeaking
              ? Colors.blueAccent.withValues(alpha: 0.5)
              : Colors.white10,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: AvatarGlow(
              animate: state.isAiSpeaking,
              glowColor: Colors.blueAccent,
              glowRadiusFactor: 0.5,
              duration: const Duration(milliseconds: 2000),
              repeat: true,
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Colors.blueAccent.withValues(alpha: 0.15),
                child: const FaIcon(
                  FontAwesomeIcons.robot,
                  size: 70,
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "AI Interviewer",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          if (state.isConnected)
            Positioned(
              top: 16,
              right: 16,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Text(
                  state.isAiSpeaking
                      ? "Speaking..."
                      : state.isListening
                      ? "Listening..."
                      : "Waiting...",
                  key: ValueKey<String>(
                    state.isAiSpeaking
                        ? "A"
                        : state.isListening
                        ? "L"
                        : "W",
                  ),
                  style: TextStyle(
                    color: state.isAiSpeaking
                        ? Colors.blueAccent
                        : Colors.white54,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
