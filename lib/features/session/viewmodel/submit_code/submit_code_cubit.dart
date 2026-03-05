import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/session/submit_code/submit_code_request_entity.dart';
import '../../../../domain/entities/session/submit_code/submit_code_response_entity.dart';
import '../../../../domain/usecase/session/submit_code/submit_code_usecase.dart';

part 'submit_code_state.dart';

@injectable
class SubmitCodeCubit extends Cubit<SubmitCodeState> {
  final SubmitCodeUseCase submitCodeUseCase;

  SubmitCodeCubit(this.submitCodeUseCase) : super(SubmitCodeInitial());

  Future<void> submitCode({
    required int sessionId,
    required SubmitCodeRequestEntity entity,
  }) async {
    emit(SubmitCodeLoading());
    try {
      final response = await submitCodeUseCase(
        sessionId: sessionId,
        entity: entity,
      );
      emit(SubmitCodeSuccess(response));
    } catch (e) {
      emit(SubmitCodeError(e.toString()));
    }
  }

  void reset() => emit(SubmitCodeInitial());
}
