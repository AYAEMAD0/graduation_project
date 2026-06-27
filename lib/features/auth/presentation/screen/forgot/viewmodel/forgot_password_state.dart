class ForgotPasswordState {
  final bool isPasswordObscure;
  final bool isConfirmPasswordObscure;
  final bool isLoading;
  final bool isSuccess;
  final String? error;
  final String? email;
  final String? resetToken;

  const ForgotPasswordState({
    this.isPasswordObscure = true,
    this.isConfirmPasswordObscure = true,
    this.isLoading = false,
    this.isSuccess = false,
    this.error,
    this.email,
    this.resetToken,
  });

  ForgotPasswordState copyWith({
    bool? isPasswordObscure,
    bool? isConfirmPasswordObscure,
    bool? isLoading,
    bool? isSuccess,
    String? error,
    String? email,
    String? resetToken,
  }) {
    return ForgotPasswordState(
      isPasswordObscure: isPasswordObscure ?? this.isPasswordObscure,
      isConfirmPasswordObscure: isConfirmPasswordObscure ?? this.isConfirmPasswordObscure,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error, // Clear error if not provided
      email: email ?? this.email,
      resetToken: resetToken ?? this.resetToken,
    );
  }
}
