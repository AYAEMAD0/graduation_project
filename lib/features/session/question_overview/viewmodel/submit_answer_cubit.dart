import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/domain/usecase/session/submit_answer/submit_answer_usecase.dart';

import 'submit_answer_state.dart';

@injectable
class SubmitAnswerCubit extends Cubit<SubmitAnswerState> {
  final SubmitAnswerUsecase submitAnswerUseCase;

  SubmitAnswerCubit(this.submitAnswerUseCase)
      : super(SubmitAnswerInitial());

  Future<void> submitAnswer(int sessionId) async {
    emit(SubmitAnswerLoading());

    try {
      final result =
          await submitAnswerUseCase(sessionId: sessionId);

      emit(SubmitAnswerSuccess(result));

    } catch (e) {
      emit(SubmitAnswerError(e.toString()));
    }
  }
}