import 'package:mock_mate_ai/domain/entities/history/history_Interview_entity.dart';


abstract class HistoryState {}

class HistoryInitial extends HistoryState {}

class HistoryLoading extends HistoryState {}

class HistorySuccess extends HistoryState {
  final List<HistoryInterviewEntity> interviews;
  HistorySuccess(this.interviews);
}

class HistoryError extends HistoryState {
  final String message;
  HistoryError(this.message);
}