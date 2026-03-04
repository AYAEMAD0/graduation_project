part of 'interview_session_cubit.dart';

sealed class InterviewSessionState {}

final class InterviewSessionInitial extends InterviewSessionState {}

final class InterviewSessionLoading extends InterviewSessionState {}

final class InterviewSessionSuccess extends InterviewSessionState {
  final InterviewSessionEntity interviewSession;

  InterviewSessionSuccess({required this.interviewSession});
}

final class InterviewSessionError extends InterviewSessionState {
  final String message;

  InterviewSessionError({required this.message});
}
