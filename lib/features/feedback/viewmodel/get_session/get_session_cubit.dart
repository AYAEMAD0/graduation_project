import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:mock_mate_ai/domain/entities/feedBack/feedback_model.dart';

import '../../../../domain/usecase/session/get_session/get_session_usecase.dart';

import 'get_session_state.dart';

@injectable
class GetSessionCubit extends Cubit<GetSessionState> {
  final GetSessionUseCase getSessionUseCase;

  GetSessionCubit(this.getSessionUseCase) : super(GetSessionInitial());

  Future<void> getSession({required int sessionId}) async {
    if (!isClosed) {
      emit(GetSessionLoading());
    }

    try {
      final session = await getSessionUseCase(sessionId: sessionId);

      FeedbackModel? feedbackModel;

      if (session.feedback != null) {
        final decoded = jsonDecode(session.feedback!);

        feedbackModel = FeedbackModel.fromJson(decoded);
      }

      if (!isClosed) {
        emit(GetSessionSuccess(session, feedbackModel));
      }
    } catch (e) {
      if (!isClosed) {
        emit(GetSessionError(e.toString()));
      }
    }
  }
}
