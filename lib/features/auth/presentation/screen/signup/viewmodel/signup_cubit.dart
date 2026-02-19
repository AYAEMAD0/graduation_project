import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/domain/repo/auth/token_storage.dart';
import '../../../../../../core/exception/app_exception.dart';
import '../../../../../../domain/entities/signup/signup_entity.dart';
import '../../../../../../domain/usecase/signup/signup_usecase.dart';
part 'signup_state.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  final SignupUsecase signupUsecase;
  final TokenStorage tokenStorage;
  SignupCubit(this.signupUsecase, this.tokenStorage) : super(SignupInitial());

  final nameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isShowPassword = false;

  Future<void> signup() async {
    if (formKey.currentState!.validate()) {
      emit(SignupLoading());

      final fullPhone = "+20 ${phoneController.text}";
      try {
        final result = await signupUsecase(
          username: userNameController.text,
          email: emailController.text,
          phoneNumber: fullPhone,
          password: passwordController.text,
          displayName: nameController.text,
          role: "user",
          avatarPath: "",
        );
        await tokenStorage.saveAccessToken(result.accessToken ?? "");
        await tokenStorage.saveRefreshToken(result.refreshToken ?? "");

        emit(SignupSuccess(data: result));
      } on DioException catch (e) {
        if (e.error is ValidationException) {
          emit(
            SignupValidationError(
              errors: (e.error as ValidationException).errors,
            ),
          );
        } else if (e.error is AppException) {
          emit(SignupError(messageError: (e.error as AppException).message));
        } else {
          emit(SignupError(messageError: "Unexpected error occurred"));
        }
      } catch (e) {
        emit(SignupError(messageError: e.toString()));
      }
    }
  }

  void togglePassword() {
    isShowPassword = !isShowPassword;
    emit(SignupTogglePassword(isShowPassword: isShowPassword));
  }
}
