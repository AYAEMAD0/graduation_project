import 'package:mock_mate_ai/domain/entities/history/history_entity.dart';

abstract class HistoryRepo{
  Future<HistoryEntity> getHistory(int pageIndex, int pageSize);
}