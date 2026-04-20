import 'package:mock_mate_ai/domain/entities/session/submit_answer/submit_answer_entity.dart';

abstract class SubmitAnswerState {}

class SubmitAnswerInitial extends SubmitAnswerState {}

class SubmitAnswerLoading extends SubmitAnswerState {}

class SubmitAnswerSuccess extends SubmitAnswerState {
  final SubmitAnswerEntity data;

  SubmitAnswerSuccess(this.data);
}

class SubmitAnswerError extends SubmitAnswerState {
  final String message;

  SubmitAnswerError(this.message);
}