import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/entities/interview_session/interview_session_entity.dart';
import '../../../domain/usecase/interview_session/interview_session_usecase.dart';

part 'interview_session_state.dart';

@injectable
class InterviewSessionCubit extends Cubit<InterviewSessionState> {
  final InterviewSessionUseCase startInterviewUseCase;

  InterviewSessionCubit(this.startInterviewUseCase)
    : super(InterviewSessionInitial());

  Future<void> startInterview({
    required List<int> cvBytes,
    required String cvFileName,
    required String jobDescription,
  }) async {
    emit(InterviewSessionLoading());
    try {
      final result = await startInterviewUseCase(
        cvBytes: cvBytes,
        cvFileName: cvFileName,
        jobDescription: jobDescription,
      );
      emit(InterviewSessionSuccess(interviewSession: result));
    } catch (e) {
      emit(InterviewSessionError(message: e.toString()));
    }
  }
}
