import 'package:flutter/material.dart';
import '../viewmodel/voice_interview_state.dart';

class ControlBar extends StatelessWidget {
  final VoiceInterviewState state;
  final VoidCallback onStart;
  final VoidCallback onToggleMic;
  final VoidCallback onEnd;

  const ControlBar({
    super.key,
    required this.state,
    required this.onStart,
    required this.onToggleMic,
    required this.onEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24, bottom: 32),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E2C),
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: !state.isConnected
          ? ElevatedButton.icon(
              onPressed: onStart,
              icon: const Icon(Icons.play_arrow_rounded),
              label: const Text("Start Interview"),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 0,
              ),
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: state.isAiSpeaking ? null : onToggleMic,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: state.isAiSpeaking
                          ? Colors.grey.withValues(alpha: 0.5)
                          : state.isListening
                          ? Colors.redAccent
                          : Colors.white10,
                      border: Border.all(
                        color: state.isListening
                            ? Colors.redAccent
                            : Colors.white24,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      state.isListening ? Icons.mic_off : Icons.mic,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                GestureDetector(
                  onTap: onEnd,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: const Icon(
                      Icons.call_end_rounded,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
