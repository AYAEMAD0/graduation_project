import '../../../../domain/entities/session/get_session/get_session_entity.dart';

abstract class GetSessionState {}

class GetSessionInitial extends GetSessionState {}

class GetSessionLoading extends GetSessionState {}

class GetSessionSuccess extends GetSessionState {
  final GetSessionEntity session;

  GetSessionSuccess(this.session);
}

class GetSessionError extends GetSessionState {
  final String message;

  GetSessionError(this.message);
}
