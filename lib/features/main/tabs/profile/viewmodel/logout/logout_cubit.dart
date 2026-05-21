import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/domain/repo/auth/token/token_storage.dart';
import 'package:mock_mate_ai/domain/usecase/auth/logout/logout_usecase.dart';

import '../../../../../../core/helper/shared_check_helper.dart';
import 'logout_state.dart';

@injectable
class LogoutCubit extends Cubit<LogoutState> {

  final LogoutUseCase logoutUseCase;
  final TokenStorage tokenStorage;

  LogoutCubit(
      this.logoutUseCase,
      this.tokenStorage,
      ) : super(const LogoutInitial());

  Future<void> logout() async {

    emit(const LogoutLoading());

    try {

      await logoutUseCase();

      await tokenStorage.clearTokens();

      await SharedCheckHelper.clearAll();

      emit(const LogoutSuccess("Logout Success"));

    } catch (e) {

      emit(LogoutError(e.toString()));

    }
  }
}