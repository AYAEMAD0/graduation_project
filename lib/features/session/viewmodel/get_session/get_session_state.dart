import 'package:mock_mate_ai/domain/entities/feedBack/feedback_model.dart';

import '../../../../domain/entities/session/get_session/get_session_entity.dart';

abstract class GetSessionState {}

class GetSessionInitial extends GetSessionState {}

class GetSessionLoading extends GetSessionState {}

class GetSessionSuccess extends GetSessionState {
  final GetSessionEntity session;
  final FeedbackModel? feedback;

  GetSessionSuccess(this.session, this.feedback);
}

class GetSessionError extends GetSessionState {
  final String message;

  GetSessionError(this.message);
}
