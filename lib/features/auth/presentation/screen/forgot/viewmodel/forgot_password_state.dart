
class ForgotPasswordState {
  final bool isPasswordObscure;
  final bool isConfirmPasswordObscure;

  const ForgotPasswordState({
    this.isPasswordObscure = true,
    this.isConfirmPasswordObscure = true,
  });

  ForgotPasswordState copyWith({
    bool? isPasswordObscure,
    bool? isConfirmPasswordObscure,
  }) {
    return ForgotPasswordState(
      isPasswordObscure: isPasswordObscure ?? this.isPasswordObscure,
      isConfirmPasswordObscure: isConfirmPasswordObscure ?? this.isConfirmPasswordObscure,
    );
  }
}
