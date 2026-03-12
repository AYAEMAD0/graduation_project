import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/core/exception/exception_handler.dart';
import 'package:mock_mate_ai/domain/usecase/history/history_usecase.dart';

import 'history_state.dart';

@injectable
class HistoryCubit extends Cubit<HistoryState> {
  final GetHistoryUsecase getHistoryUseCase;

  HistoryCubit(this.getHistoryUseCase) : super(HistoryInitial());

  Future<void> fetchHistory({int pageIndex = 1, int pageSize = 10}) async {
    emit(HistoryLoading());
    try {
      final historyEntity = await getHistoryUseCase.call(pageIndex, pageSize);
      if (historyEntity.data == null || historyEntity.data!.isEmpty) {
        emit(HistoryEmpty());
      } else {
        emit(HistorySuccess(historyEntity));
      }
    } catch (e) {
      final errorMessage = ExceptionHandler.getMessage(e);
      emit(HistoryError(errorMessage));
    }
  }
}