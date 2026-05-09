class VoicePreInterviewState {
  final String? selectedTrack;
  final bool isMicAllowed;
  final bool isCheckingMic;
  final bool isCameraAllowed;
  final bool isCheckingCamera;

  const VoicePreInterviewState({
    this.selectedTrack,
    this.isMicAllowed = false,
    this.isCheckingMic = false,
    this.isCameraAllowed = false,
    this.isCheckingCamera = false,
  });

  bool get canProceed =>
      selectedTrack != null && isMicAllowed && isCameraAllowed;

  static const _clear = Object();

  VoicePreInterviewState copyWith({
    Object? selectedTrack = _clear,
    bool? isMicAllowed,
    bool? isCheckingMic,
    bool? isCameraAllowed,
    bool? isCheckingCamera,
  }) {
    return VoicePreInterviewState(
      selectedTrack: selectedTrack == _clear
          ? this.selectedTrack
          : selectedTrack as String?,
      isMicAllowed: isMicAllowed ?? this.isMicAllowed,
      isCheckingMic: isCheckingMic ?? this.isCheckingMic,
      isCameraAllowed: isCameraAllowed ?? this.isCameraAllowed,
      isCheckingCamera: isCheckingCamera ?? this.isCheckingCamera,
    );
  }
}
