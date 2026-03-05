import '../../../../domain/entities/session/run_code/run_code_response_entity.dart';

abstract class RunCodeState {}

class RunCodeInitial extends RunCodeState {}

class RunCodeLoading extends RunCodeState {}

class RunCodeSuccess extends RunCodeState {
  final RunCodeResponseEntity response;

  RunCodeSuccess(this.response);
}

class RunCodeError extends RunCodeState {
  final String message;

  RunCodeError(this.message);
}
