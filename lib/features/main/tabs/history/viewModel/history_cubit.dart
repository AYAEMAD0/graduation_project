import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/exception/exception_handler.dart';
import '../../../../../domain/usecase/history/history_usecase.dart';
import 'history_state.dart';

@injectable
class HistoryCubit extends Cubit<HistoryState> {
  final GetHistoryUsecase getHistoryUseCase;

  HistoryCubit(this.getHistoryUseCase) : super(HistoryInitial());

  static const int _pageSize = 10;

  Future<void> fetchHistory() async {
    if (isClosed) return;
    emit(HistoryLoading());
    try {
      final result = await getHistoryUseCase.call(1, _pageSize);
      if (isClosed) return;

      final items = result.data ?? [];
      if (items.isEmpty) {
        emit(HistoryEmpty());
      } else {
        final totalCount = result.totalCount ?? 0;
        emit(HistorySuccess(
          items: items,
          currentPage: 1,
          hasMore: items.length < totalCount,
        ));
      }
    } catch (e) {
      if (isClosed) return;
      emit(HistoryError(ExceptionHandler.getMessage(e)));
    }
  }

  Future<void> loadMore() async {
    final current = state;
    if (current is! HistorySuccess) return;
    if (!current.hasMore || current.isLoadingMore || isClosed) return;

    emit(current.copyWith(isLoadingMore: true));

    try {
      final nextPage = current.currentPage + 1;
      final result = await getHistoryUseCase.call(nextPage, _pageSize);
      if (isClosed) return;

      final newItems = result.data ?? [];
      final allItems = [...current.items, ...newItems];
      final totalCount = result.totalCount ?? 0;

      emit(HistorySuccess(
        items: allItems,
        currentPage: nextPage,
        hasMore: allItems.length < totalCount,
      ));
    } catch (e) {
      if (isClosed) return;
      emit(current.copyWith(isLoadingMore: false));
    }
  }
}