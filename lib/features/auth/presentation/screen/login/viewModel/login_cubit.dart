import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/core/helper/shared_check_helper.dart';
import 'package:mock_mate_ai/features/auth/presentation/screen/login/viewModel/login_state.dart';

import '../../../../../../core/exception/app_exception.dart';
import '../../../../../../domain/repo/auth/token/token_storage.dart';
import '../../../../../../domain/usecase/auth/login/login_usecase.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase loginUsecase;
  final TokenStorage tokenStorage;
  LoginCubit(this.loginUsecase, this.tokenStorage) : super(LoginInitial());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isShowPassword = false;

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoading());

      try {
        final result = await loginUsecase(
          email: emailController.text,
          password: passwordController.text,
        );
        await tokenStorage.saveAccessToken(result.accessToken);
        await tokenStorage.saveRefreshToken(result.refreshToken);
        await SharedCheckHelper.setValue(
          SharedCheckHelper.keyDisplayName,
          result.profile.displayName ?? "User",
        );
        emit(LoginSuccess(data: result));
      } on DioException catch (e) {
        if (e.error is ValidationException) {
          emit(LoginValidationError(
              errors: (e.error as ValidationException).errors));
        } else if (e.error is AppException) {
          emit(LoginError(messageError: (e.error as AppException).message));
        } else {
          // غير السطر ده مؤقتاً عشان تشوف الـ error الحقيقي
          emit(LoginError(
            messageError: "Type: ${e.type} | Error: ${e.error} | Msg: ${e
                .message}",
          ));
        }
      } catch (e) {
        emit(LoginError(messageError: "Catch: ${e.toString()}"));
      }
    }
  }

  void togglePassword() {
    isShowPassword = !isShowPassword;
    emit(LoginTogglePassword(isShowPassword: isShowPassword));
  }
}
