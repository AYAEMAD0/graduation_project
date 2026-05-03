import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/domain/usecase/session/interview_session/start_ai_interview_use_case.dart';
import 'package:mock_mate_ai/features/session/viewmodel/interview_session/ai_interview_state.dart';

@injectable
class AiInterviewCubit extends Cubit<AiInterviewState>{
  final StartAiInterviewUseCase startAiInterviewUseCase;
  AiInterviewCubit(this.startAiInterviewUseCase) : super(AiInterviewInitial());

Future <void> startAiInterview({
    required List<int> cvBytes,
  required String cvFileName,
  required String jobDescription,
})async{
  emit(AiInterviewLoading());
  try{
    final result = await startAiInterviewUseCase(
      cvBytes: cvBytes,
      cvFileName: cvFileName,
      jobDescription: jobDescription,
    );
    emit(AiInterviewSuccess(interviewSession: result));
  }
  catch(e){
    emit(AiInterviewError(message: e.toString()));
  }

}
}