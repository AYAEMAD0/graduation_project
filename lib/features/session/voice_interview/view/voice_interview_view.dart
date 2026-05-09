import 'dart:async';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_mate_ai/core/routes/app_routes.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../core/theme/app_color.dart';
import '../viewmodel/voice_interview_cubit.dart';
import '../widget/voice_interview_body.dart';

class VoiceInterviewView extends StatefulWidget {
  final String track;

  const VoiceInterviewView({super.key, required this.track});

  @override
  State<VoiceInterviewView> createState() => _VoiceInterviewViewState();
}

class _VoiceInterviewViewState extends State<VoiceInterviewView> {
  late final VoiceInterviewCubit _cubit;
  bool _isServiceInitialized = false;
  Timer? _timer;
  CameraController? _cameraController;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<VoiceInterviewCubit>();

    _cubit.onInterviewComplete = (int sessionId) {
      if (!mounted) return;
      _timer?.cancel();
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.feedback,
        (route) => route.isFirst,
        arguments: sessionId,
      );
    };

    _initService();
    _initCamera();
  }

  Future<void> _initService() async {
    await _cubit.initialize();
    if (mounted) setState(() => _isServiceInitialized = true);
  }

  Future<void> _initCamera() async {
    try {
      final cameras = await availableCameras();
      final front = cameras.firstWhere(
        (c) => c.lensDirection == CameraLensDirection.front,
        orElse: () => cameras.first,
      );
      _cameraController = CameraController(
        front,
        ResolutionPreset.medium,
        enableAudio: false,
      );
      await _cameraController!.initialize();
      if (mounted) setState(() => _isCameraInitialized = true);
    } catch (e) {
      debugPrint('Camera error: $e');
    }
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => _cubit.tickTimer(),
    );
  }

  void _handleEndInterview() {
    _cameraController?.dispose();
    _cameraController = null;
    setState(() => _isCameraInitialized = false);
    _timer?.cancel();
    _cubit.endInterview();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints
        .of(context)
        .isMobile;
    return Scaffold(
      body: !_isServiceInitialized
          ? const Center(
              child: CircularProgressIndicator(color: Colors.blueAccent),
            )
          : SafeArea(
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
            VoiceInterviewBody(
              track: widget.track,
              isCameraInitialized: _isCameraInitialized,
              cameraController: _cameraController,
              onStart: () {
                _cubit.connect(widget.track);
                _startTimer();
              },
              onEnd: _handleEndInterview,
            ),
          ],
        ),
      ),
    );
  }
}
