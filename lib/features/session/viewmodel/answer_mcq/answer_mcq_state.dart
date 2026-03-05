import '../../../../domain/entities/session/answer_mcq/answer_mcq_response_entity.dart';

abstract class AnswerMcqState {}

class AnswerMcqInitial extends AnswerMcqState {}

class AnswerMcqLoading extends AnswerMcqState {}

class AnswerMcqSuccess extends AnswerMcqState {
  final AnswerMcqResponseEntity response;

  AnswerMcqSuccess(this.response);
}

class AnswerMcqError extends AnswerMcqState {
  final String message;

  AnswerMcqError(this.message);
}
