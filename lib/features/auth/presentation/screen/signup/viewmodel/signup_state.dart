part of 'signup_cubit.dart';


sealed class SignupState {}

final class SignupInitial extends SignupState {}
final class SignupLoading extends SignupState {}
final class SignupSuccess extends SignupState {
  final SignupEntity data;
  SignupSuccess({required this.data});
}
final class SignupError extends SignupState {
  final String messageError;
  SignupError({required this.messageError});
}
final class SignupValidationError extends SignupState {
  final Map<String, List<String>> errors;
  SignupValidationError({required this.errors});
}
class SignupTogglePassword extends SignupState {
  final bool isShowPassword;
  SignupTogglePassword({required this.isShowPassword});
}
