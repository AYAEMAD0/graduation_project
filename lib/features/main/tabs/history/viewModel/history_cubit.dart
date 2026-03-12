import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/core/exception/exception_handler.dart';
import 'package:mock_mate_ai/domain/usecase/history/history_useCase.dart';
import 'history_state.dart';

@injectable
class HistoryCubit extends Cubit<HistoryState>{
  final GetHistoryUseCase getHistoryUseCase;
  HistoryCubit(this.getHistoryUseCase): super(HistoryInitial());

  Future<void> fetchHistory()async{
    emit(HistoryLoading());
    try{
      final history = await getHistoryUseCase.call(1, 10);
      if(history.isEmpty){
        emit(HistorySuccess(const []));
      }else
        emit(HistorySuccess(history));
    }catch(e){
      final errorMessage = ExceptionHandler.getMessage(e);
      emit(HistoryError(errorMessage));
    }
  }

}