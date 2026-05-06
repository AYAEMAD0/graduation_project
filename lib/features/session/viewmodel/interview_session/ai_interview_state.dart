import '../../../../domain/entities/session/interview_session/interview_session_entity.dart';

sealed class AiInterviewState {}

final class AiInterviewInitial extends AiInterviewState {}

final class AiInterviewLoading extends AiInterviewState {}

final class AiInterviewSuccess extends AiInterviewState {
  final InterviewSessionEntity interviewSession;

  AiInterviewSuccess({required this.interviewSession});
}

final class AiInterviewError extends AiInterviewState {
  final String message;

  AiInterviewError({required this.message});
}