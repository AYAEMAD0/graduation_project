import '../../../../../domain/entities/history/history_entity.dart';

abstract class HistoryState {}

class HistoryInitial extends HistoryState {}

class HistoryLoading extends HistoryState {}

class HistorySuccess extends HistoryState {
  final HistoryEntity historyEntity;

  HistorySuccess(this.historyEntity);
}

class HistoryEmpty extends HistoryState {}

class HistoryError extends HistoryState {
  final String message;
  HistoryError(this.message);
}