import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:mock_mate_ai/api/api_endpoint.dart';
import 'package:mock_mate_ai/api/api_services.dart';
import '../../../../../data/data_source/remote/session/voice/voice_interview_remote_data_source.dart';
import '../../../../../domain/entities/session/voice/voice_interview_entity.dart';
import '../../../../model/session/voice/voice_interview_model_dto.dart';

@Injectable(as: VoiceInterviewRemoteDataSource)
class VoiceInterviewRemoteDataSourceImpl
    implements VoiceInterviewRemoteDataSource {
  final ApiServices _apiServices;
  WebSocketChannel? _channel;
  final _eventController = StreamController<VoiceInterviewWsEvent>.broadcast();

  VoiceInterviewRemoteDataSourceImpl({required ApiServices apiServices})
    : _apiServices = apiServices;

  @override
  Stream<VoiceInterviewWsEvent> get wsEvents => _eventController.stream;

  @override
  Future<VoiceInterviewModelDto> createSession(String track) async {
    final response = await _apiServices.post(
      ApiEndpoint.startLiveInterviewApi,
      data: {'trackName': track},
    );
    return VoiceInterviewModelDto.fromJson(
      response.data as Map<String, dynamic>,
    );
  }

  @override
  Future<void> submitResult({
    required int sessionId,
    required double score,
    required String feedback,
  }) async {
    await _apiServices.post(
      ApiEndpoint.submitLiveInterviewApi(sessionId),
      data: {'score': score, 'feedback': feedback},
    );
  }

  @override
  void connectWebSocket({required String token, required String track}) {
    final wsUrl = Uri.parse('ws://127.0.0.1:8000/ws/voice-interview');
    _channel = WebSocketChannel.connect(wsUrl);

    _channel!.sink.add(jsonEncode({'token': token}));
    _channel!.sink.add(
      jsonEncode({'event': 'start_interview', 'track': track}),
    );

    _channel!.stream.listen(
      (message) {
        try {
          final data = jsonDecode(message as String) as Map<String, dynamic>;
          final event = _parseEvent(data);
          if (event != null) _eventController.add(event);
        } catch (e) {
          debugPrint('WS parse error: $e');
        }
      },
      onDone: () => _eventController.add(WsDisconnectedEvent()),
      onError: (e) {
        debugPrint('WS error: $e');
        _eventController.add(WsDisconnectedEvent());
      },
    );
  }

  @override
  void sendWsEvent(Map<String, dynamic> payload) {
    _channel?.sink.add(jsonEncode(payload));
  }

  @override
  void disconnectWebSocket() {
    _channel?.sink.close();
  }

  VoiceInterviewWsEvent? _parseEvent(Map<String, dynamic> data) {
    switch (data['event']) {
      case 'ai_sentence':
        return WsAiSentenceEvent(text: data['text'] as String);
      case 'ai_turn_complete':
        return WsAiTurnCompleteEvent();
      case 'interview_result':
        final feedbackRaw = data['feedback'];
        return WsInterviewResultEvent(
          score: (data['score'] as num).toDouble(),
          feedback: feedbackRaw is String
              ? feedbackRaw
              : jsonEncode(feedbackRaw),
        );
      default:
        return null;
    }
  }

  void dispose() => _eventController.close();
}
