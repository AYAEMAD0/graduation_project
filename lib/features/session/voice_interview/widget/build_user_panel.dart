import 'dart:math' as math;
import 'package:avatar_glow/avatar_glow.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class UserPanel extends StatelessWidget {
  final bool isListening;
  final bool isCameraInitialized;
  final CameraController? cameraController;

  const UserPanel({
    super.key,
    required this.isListening,
    required this.isCameraInitialized,
    required this.cameraController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white10, width: 2),
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
          if (isCameraInitialized && cameraController != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Center(
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(math.pi),
                  child: CameraPreview(cameraController!),
                ),
              ),
            )
          else
            const Center(
              child: Icon(Icons.videocam_off, color: Colors.white24, size: 48),
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
                "You",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          if (isListening)
            Positioned(
              top: 16,
              right: 16,
              child: AvatarGlow(
                animate: true,
                glowColor: Colors.greenAccent,
                glowRadiusFactor: 0.8,
                child: const Icon(
                  Icons.mic,
                  color: Colors.greenAccent,
                  size: 24,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
