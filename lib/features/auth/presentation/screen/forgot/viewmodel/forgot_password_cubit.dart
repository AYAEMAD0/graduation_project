import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_mate_ai/core/config/di.dart';
import 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(const ForgotPasswordState());

  final dio = getIt<Dio>();

  void togglePassword() {
    emit(state.copyWith(isPasswordObscure: !state.isPasswordObscure));
  }

  void toggleConfirmPassword() {
    emit(state.copyWith(isConfirmPasswordObscure: !state.isConfirmPasswordObscure));
  }

  Future<void> sendOtp(String email) async {
    emit(state.copyWith(isLoading: true, isSuccess: false, error: null));
    try {
      await dio.post('/api/users/forgot-password', data: {'email': email});
      emit(state.copyWith(isLoading: false, isSuccess: true, email: email));
    } catch (e) {
      String errorMessage = "Failed to send OTP.";
      if (e is DioException) {
        if (e.response?.data != null) {
          errorMessage = e.response?.data.toString() ?? errorMessage;
        } else {
          errorMessage = e.message ?? errorMessage;
        }
      }
      emit(state.copyWith(isLoading: false, isSuccess: false, error: errorMessage));
    }
  }

  Future<void> verifyOtp(String email, String otp) async {
    emit(state.copyWith(isLoading: true, isSuccess: false, error: null));
    try {
      final response = await dio.post('/api/users/verify-otp', data: {
        'email': email,
        'otp': otp,
      });
      final resetToken = response.data['data'] != null ? response.data['data']['resetToken'] : response.data['resetToken'];
      emit(state.copyWith(isLoading: false, isSuccess: true, resetToken: resetToken));
    } catch (e) {
      String errorMessage = "Invalid or expired OTP.";
      if (e is DioException && e.response?.data != null) {
        errorMessage = e.response?.data['message'] ?? errorMessage;
      }
      emit(state.copyWith(isLoading: false, isSuccess: false, error: errorMessage));
    }
  }

  Future<void> submitNewPassword(String email, String resetToken, String newPassword) async {
    emit(state.copyWith(isLoading: true, isSuccess: false, error: null));
    try {
      await dio.post('/api/users/reset-password', data: {
        'email': email,
        'resetToken': resetToken,
        'newPassword': newPassword,
      });
      emit(state.copyWith(isLoading: false, isSuccess: true));
    } catch (e) {
      String errorMessage = "Failed to reset password.";
      if (e is DioException && e.response?.data != null) {
        errorMessage = e.response?.data['message'] ?? errorMessage;
      }
      emit(state.copyWith(isLoading: false, isSuccess: false, error: errorMessage));
    }
  }
}
