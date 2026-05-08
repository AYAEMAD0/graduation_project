import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'voice_pre_interview_state.dart';

class VoicePreInterviewCubit extends Cubit<VoicePreInterviewState> {
  VoicePreInterviewCubit() : super(const VoicePreInterviewState());

  void selectTrack(String track) {
    emit(state.copyWith(selectedTrack: track));
  }

  Future<void> requestMicPermission() async {
    emit(state.copyWith(isCheckingMic: true));

    final stt = SpeechToText();
    final available = await stt.initialize(
      onError: (e) {
        debugPrint('STT Error: $e');
        if (!isClosed)
          emit(state.copyWith(isMicAllowed: false, isCheckingMic: false));
      },
      onStatus: (status) {
        if (status == 'listening') {
          stt.stop();
          if (!isClosed)
            emit(state.copyWith(isMicAllowed: true, isCheckingMic: false));
        }
      },
    );

    if (available) {
      stt.listen(onResult: (_) {});
    } else {
      if (!isClosed)
        emit(state.copyWith(isMicAllowed: false, isCheckingMic: false));
    }
  }

  Future<void> requestCameraPermission() async {
    emit(state.copyWith(isCheckingCamera: true));

    try {
      final cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        final controller = CameraController(
          cameras.first,
          ResolutionPreset.low,
        );
        await controller.initialize();
        await controller.dispose();
        if (!isClosed)
          emit(state.copyWith(isCameraAllowed: true, isCheckingCamera: false));
      } else {
        if (!isClosed)
          emit(state.copyWith(isCameraAllowed: false, isCheckingCamera: false));
      }
    } catch (e) {
      debugPrint('Camera Error: $e');
      if (!isClosed)
        emit(state.copyWith(isCameraAllowed: false, isCheckingCamera: false));
    }
  }
}
