import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/domain/usecase/logout/logout_usecase.dart';
import 'logout_state.dart';

@injectable
class LogoutCubit extends Cubit<LogoutState> {
  final LogoutUseCase logoutUseCase;

  LogoutCubit(this.logoutUseCase)
      : super(const LogoutInitial());

  Future<void> logout() async {
    emit(const LogoutLoading());
    try {
      final response = await logoutUseCase();
      final message = response.message;
      emit(LogoutSuccess(message));
      emit(LogoutSuccess(message));
    } catch (e) {
      emit(LogoutError(e.toString()));
    }
  }
}