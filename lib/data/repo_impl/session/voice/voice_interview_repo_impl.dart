import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/entities/session/voice/voice_interview_entity.dart';
import '../../../../domain/repo/session/voice/voice_interview_repo.dart';
import '../../../data_source/remote/session/voice/voice_interview_remote_data_source.dart';

@Injectable(as: VoiceInterviewRepo)
class VoiceInterviewRepoImpl implements VoiceInterviewRepo {
  final VoiceInterviewRemoteDataSource _dataSource;

  VoiceInterviewRepoImpl({required VoiceInterviewRemoteDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Stream<VoiceInterviewWsEvent> get wsEvents => _dataSource.wsEvents;

  @override
  Future<int?> createSession(String track) async {
    try {
      final model = await _dataSource.createSession(track);
      return model.sessionId;
    } catch (e) {
      debugPrint('createSession error: $e');
      return null;
    }
  }

  @override
  Future<void> submitResult({
    required int sessionId,
    required double score,
    required String feedback,
  }) async {
    try {
      await _dataSource.submitResult(
        sessionId: sessionId,
        score: score,
        feedback: feedback,
      );
    } catch (e) {
      debugPrint('submitResult error: $e');
    }
  }

  @override
  void connectWebSocket({required String token, required String track}) =>
      _dataSource.connectWebSocket(token: token, track: track);

  @override
  void sendWsEvent(Map<String, dynamic> payload) =>
      _dataSource.sendWsEvent(payload);

  @override
  void disconnectWebSocket() => _dataSource.disconnectWebSocket();
}
