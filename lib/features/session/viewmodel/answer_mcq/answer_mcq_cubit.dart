import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/session/answer_mcq/answer_mcq_request_entity.dart';
import '../../../../domain/usecase/session/answer_mcq/answer_mcq_usecase.dart';
import 'answer_mcq_state.dart';

@injectable
class AnswerMcqCubit extends Cubit<AnswerMcqState> {
  final AnswerMcqUseCase answerMcqUseCase;

  AnswerMcqCubit(this.answerMcqUseCase) : super(AnswerMcqInitial());

  Future<void> answerMcq({
    required int sessionId,
    required AnswerMcqRequestEntity entity,
  }) async {
    emit(AnswerMcqLoading());
    try {
      final response = await answerMcqUseCase(
        sessionId: sessionId,
        entity: entity,
      );
      emit(AnswerMcqSuccess(response));
    } catch (e) {
      emit(AnswerMcqError(e.toString()));
    }
  }

  void reset() => emit(AnswerMcqInitial());
}
