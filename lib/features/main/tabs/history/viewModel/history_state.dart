
abstract class HistoryState {}

class HistoryInitial extends HistoryState {}

class HistoryLoading extends HistoryState {}

class HistorySuccess extends HistoryState {
  final List<dynamic> items;
  final int currentPage;
  final bool hasMore;
  final bool isLoadingMore;

  HistorySuccess({
    required this.items,
    this.currentPage = 1,
    this.hasMore = false,
    this.isLoadingMore = false,
  });

  HistorySuccess copyWith({
    List<dynamic>? items,
    int? currentPage,
    bool? hasMore,
    bool? isLoadingMore,
  }) {
    return HistorySuccess(
      items: items ?? this.items,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

class HistoryEmpty extends HistoryState {}

class HistoryError extends HistoryState {
  final String message;
  HistoryError(this.message);
}