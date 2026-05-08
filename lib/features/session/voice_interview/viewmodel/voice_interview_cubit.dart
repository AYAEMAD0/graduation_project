import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:mock_mate_ai/domain/repo/auth/token/token_storage.dart';
import '../../../../domain/entities/session/voice/voice_interview_entity.dart';
import '../../../../domain/repo/session/voice/voice_interview_repo.dart';
import '../../../../domain/usecase/session/voice/start_live_interview_usecase.dart';
import '../../../../domain/usecase/session/voice/submit_live_interview_usecase.dart';
import 'voice_interview_state.dart';

class VoiceInterviewCubit extends Cubit<VoiceInterviewState> {
  final VoiceInterviewRepo _repo;
  final StartLiveInterviewUseCase _startUseCase;
  final SubmitLiveInterviewUseCase _submitUseCase;
  final TokenStorage _tokenStorage;

  final SpeechToText _stt = SpeechToText();
  final FlutterTts _tts = FlutterTts();
  final List<String> _ttsQueue = [];

  bool _aiFinishedGenerating = true;
  String _lastRecognizedWords = '';
  String _lastRawRecognizedWords = '';
  String _lastSentSpeech = '';
  Timer? _silenceTimer;
  StreamSubscription? _wsSub;

  void Function(int sessionId)? onInterviewComplete;

  VoiceInterviewCubit({
    required VoiceInterviewRepo repo,
    required TokenStorage tokenStorage,
  }) : _repo = repo,
       _startUseCase = StartLiveInterviewUseCase(repo),
       _submitUseCase = SubmitLiveInterviewUseCase(repo),
       _tokenStorage = tokenStorage,
       super(const VoiceInterviewState());

  Future<void> initialize() async {
    await _stt.initialize(
      onStatus: (status) {
        if (status == 'notListening') {
          emit(state.copyWith(isListening: false));
          if (state.isConnected &&
              _aiFinishedGenerating &&
              !state.isAiSpeaking) {
            Future.delayed(const Duration(milliseconds: 100), startListening);
          }
        }
      },
      onError: (e) => debugPrint('STT Error: $e'),
    );

    await _tts.setLanguage('en-US');
    await _tts.setSpeechRate(0.5);
    await _tts.setVolume(1.0);
    await _tts.setPitch(1.0);
    _tts.setCompletionHandler(_processNextTts);
    _tts.setErrorHandler((msg) {
      debugPrint('TTS Error: $msg');
      _processNextTts();
    });
  }

  Future<void> connect(String track) async {
    if (state.isConnected) return;

    _resetSessionState();

    final sessionId = await _startUseCase(track);
    final token = await _tokenStorage.getAccessToken() ?? '';

    _repo.connectWebSocket(token: token, track: track);
    emit(
      state.copyWith(
        status: VoiceInterviewStatus.connected,
        sessionId: sessionId,
      ),
    );

    _wsSub = _repo.wsEvents.listen(_handleWsEvent);
  }

  void _handleWsEvent(VoiceInterviewWsEvent event) {
    if (isClosed) return;

    if (event is WsAiSentenceEvent) {
      _aiFinishedGenerating = false;
      _cancelTimer();
      _stt.stop();
      emit(state.copyWith(isListening: false));
      _ttsQueue.add(event.text);
      if (!state.isAiSpeaking) _processNextTts();
    } else if (event is WsAiTurnCompleteEvent) {
      _aiFinishedGenerating = true;
      if (!state.isAiSpeaking) startListening();
    } else if (event is WsInterviewResultEvent) {
      emit(state.copyWith(status: VoiceInterviewStatus.evaluating));
      _submitResult(event);
    } else if (event is WsDisconnectedEvent) {
      emit(state.copyWith(status: VoiceInterviewStatus.initial));
    }
  }

  Future<void> _submitResult(WsInterviewResultEvent event) async {
    final id = state.sessionId;
    if (id == null) return;

    await _submitUseCase(
      VoiceInterviewResultEntity(
        sessionId: id,
        score: event.score,
        feedback: event.feedback,
      ),
    );

    _repo.disconnectWebSocket();
    emit(state.copyWith(status: VoiceInterviewStatus.done));
    onInterviewComplete?.call(id);
  }

  void endInterview() {
    if (!state.isConnected) return;
    _tts.stop();
    _ttsQueue.clear();
    _cancelTimer();
    _stt.stop();
    emit(
      state.copyWith(
        isListening: false,
        isAiSpeaking: false,
        status: VoiceInterviewStatus.evaluating,
      ),
    );
    _repo.sendWsEvent({'event': 'end_interview'});
  }

  void startListening() {
    if (!state.isConnected || state.isAiSpeaking || !_aiFinishedGenerating)
      return;
    _lastRecognizedWords = '';
    _lastRawRecognizedWords = '';
    _cancelTimer();

    if (!_stt.isListening) {
      _stt.listen(
        onResult: (result) {
          if (!state.isListening ||
              state.isAiSpeaking ||
              !_aiFinishedGenerating)
            return;
          if (result.recognizedWords.isEmpty) return;

          _lastRawRecognizedWords = result.recognizedWords;
          var currentWords = result.recognizedWords;

          if (_lastSentSpeech.isNotEmpty &&
              currentWords.startsWith(_lastSentSpeech)) {
            currentWords = currentWords
                .substring(_lastSentSpeech.length)
                .trim();
          }

          if (currentWords.isNotEmpty) {
            _lastRecognizedWords = currentWords;
            _cancelTimer();
            _silenceTimer = Timer(const Duration(milliseconds: 1200), () {
              if (_lastRecognizedWords.isNotEmpty) {
                stopListening();
                _sendSpeech();
              }
            });
          }
        },
        localeId: 'en-US',
      );
    }
    emit(state.copyWith(isListening: true));
  }

  void stopListening() {
    _cancelTimer();
    _stt.stop();
    emit(state.copyWith(isListening: false));
  }

  void tickTimer() {
    if (state.remainingSeconds > 0) {
      emit(state.copyWith(remainingSeconds: state.remainingSeconds - 1));
    } else {
      endInterview();
    }
  }

  void _processNextTts() {
    if (isClosed) return;
    if (_ttsQueue.isNotEmpty) {
      emit(state.copyWith(isAiSpeaking: true));
      _tts.speak(_ttsQueue.removeAt(0));
    } else {
      emit(state.copyWith(isAiSpeaking: false));
      if (_aiFinishedGenerating && state.isConnected) startListening();
    }
  }

  void _sendSpeech() {
    if (_lastRecognizedWords.isEmpty || !state.isConnected) return;
    _lastSentSpeech = _lastRawRecognizedWords;
    _aiFinishedGenerating = false;
    _repo.sendWsEvent({'event': 'user_speech', 'text': _lastRecognizedWords});
    _lastRecognizedWords = '';
    _lastRawRecognizedWords = '';
  }

  void _resetSessionState() {
    _lastSentSpeech = '';
    _ttsQueue.clear();
    _aiFinishedGenerating = true;
  }

  void _cancelTimer() {
    _silenceTimer?.cancel();
    _silenceTimer = null;
  }

  @override
  Future<void> close() {
    _wsSub?.cancel();
    _repo.disconnectWebSocket();
    _stt.stop();
    _tts.stop();
    _silenceTimer?.cancel();
    return super.close();
  }
}
