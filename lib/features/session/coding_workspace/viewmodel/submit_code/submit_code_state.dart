part of 'submit_code_cubit.dart';

abstract class SubmitCodeState {}

class SubmitCodeInitial extends SubmitCodeState {}

class SubmitCodeLoading extends SubmitCodeState {}

class SubmitCodeSuccess extends SubmitCodeState {
  final SubmitCodeResponseEntity response;

  SubmitCodeSuccess(this.response);
}

class SubmitCodeError extends SubmitCodeState {
  final String message;

  SubmitCodeError(this.message);
}
