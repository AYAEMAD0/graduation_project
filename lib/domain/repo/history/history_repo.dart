import 'package:mock_mate_ai/domain/entities/history/history_Interview_entity.dart';

abstract class HistoryRepo{
  Future<List<HistoryInterviewEntity>> getHistory(int pageIndex,int pageSize);
}