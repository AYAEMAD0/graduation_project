import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/domain/entities/session/run_code/run_code_request_entity.dart';

import '../../../../../domain/usecase/session/run_code/run_code_usecase.dart';
import 'run_code_state.dart';

@injectable
class RunCodeCubit extends Cubit<RunCodeState> {
  final RunCodeUseCase runCodeUseCase;

  RunCodeCubit(this.runCodeUseCase) : super(RunCodeInitial());

  Future<void> runCode({
    required int sessionId,
    required RunCodeRequestEntity entity,
  }) async {
    emit(RunCodeLoading());
    try {
      final response = await runCodeUseCase(
        sessionId: sessionId,
        entity: entity,
      );
      emit(RunCodeSuccess(response));
    } catch (e) {
      emit(RunCodeError(e.toString()));
    }
  }

  void reset() => emit(RunCodeInitial());
}
