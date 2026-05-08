import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_mate_ai/core/routes/app_routes.dart';
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
    return Scaffold(
      backgroundColor: const Color(0xFF15151E),
      appBar: AppBar(
        title: Text(
          '${widget.track} Interview',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color(0xFF15151E),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: !_isServiceInitialized
          ? const Center(
              child: CircularProgressIndicator(color: Colors.blueAccent),
            )
          : VoiceInterviewBody(
              track: widget.track,
              isCameraInitialized: _isCameraInitialized,
              cameraController: _cameraController,
              onStart: () {
                _cubit.connect(widget.track);
                _startTimer();
              },
              onEnd: _handleEndInterview,
            ),
    );
  }
}
