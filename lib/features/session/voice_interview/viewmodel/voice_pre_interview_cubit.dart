import 'dart:html' as html;

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'voice_pre_interview_state.dart';

class VoicePreInterviewCubit extends Cubit<VoicePreInterviewState> {
  VoicePreInterviewCubit() : super(const VoicePreInterviewState());

  void selectTrack(String track) {
    emit(state.copyWith(selectedTrack: track));
  }

  Future<void> requestMicPermission() async {
    emit(state.copyWith(isCheckingMic: true));

    try {
      await html.window.navigator.mediaDevices!.getUserMedia({'audio': true});
      if (!isClosed) {
        emit(state.copyWith(isMicAllowed: true, isCheckingMic: false));
      }
    } catch (e) {
      debugPrint('Mic Error: $e');
      if (!isClosed) {
        emit(state.copyWith(isMicAllowed: false, isCheckingMic: false));
      }
    }
  }

  Future<void> requestCameraPermission() async {
    emit(state.copyWith(isCheckingCamera: true));

    try {
      await html.window.navigator.mediaDevices!.getUserMedia({'video': true});
      if (!isClosed) {
        emit(state.copyWith(isCameraAllowed: true, isCheckingCamera: false));
      }
    } catch (e) {
      debugPrint('Camera Error: $e');
      if (!isClosed) {
        emit(state.copyWith(isCameraAllowed: false, isCheckingCamera: false));
      }
    }
  }
}