import 'package:flutter/material.dart';

import '../../../../core/theme/app_style.dart';
import 'permission_check_tile.dart';

class HardwareCheckSection extends StatelessWidget {
  final bool isMicAllowed;
  final bool isCheckingMic;
  final bool isCameraAllowed;
  final bool isCheckingCamera;
  final Future<void> Function() onAllowMic;
  final Future<void> Function() onAllowCamera;

  const HardwareCheckSection({
    required this.isMicAllowed,
    required this.isCheckingMic,
    required this.isCameraAllowed,
    required this.isCheckingCamera,
    required this.onAllowMic,
    required this.onAllowCamera,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('2. Hardware Check',
            style: AppStyle.font24BlackBold.copyWith(fontSize: 20)),
        const SizedBox(height: 8),
        PermissionCheckTile(
          isAllowed: isMicAllowed,
          isChecking: isCheckingMic,
          title: 'Microphone',
          allowedSubtitle: 'Your browser has granted microphone permissions.',
          deniedSubtitle:
              'We need access to your microphone to conduct the voice interview.',
          icon: Icons.mic,
          accentColor: Colors.blueAccent,
          onAllow: onAllowMic,
        ),
        const SizedBox(height: 8),
        PermissionCheckTile(
          isAllowed: isCameraAllowed,
          isChecking: isCheckingCamera,
          title: 'Camera',
          allowedSubtitle: 'Your browser has granted camera permissions.',
          deniedSubtitle:
              'We need access to your camera for the local mirror preview.',
          icon: Icons.videocam,
          accentColor: Colors.purpleAccent,
          onAllow: onAllowCamera,
        ),
      ],
    );
  }
}
