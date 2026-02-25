import 'package:mock_mate_ai/domain/entities/login/login_entity.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final LoginEntity data;
  LoginSuccess({required this.data});
}

final class LoginError extends LoginState {
  final String messageError;
  LoginError({required this.messageError});
}

final class LoginValidationError extends LoginState {
  final Map<String, List<String>> errors;
  LoginValidationError({required this.errors});
}

class LoginTogglePassword extends LoginState {
  final bool isShowPassword;
  LoginTogglePassword({required this.isShowPassword});
}
