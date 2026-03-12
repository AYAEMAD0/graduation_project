import 'package:mock_mate_ai/api/model/history/history_model.dart';

abstract class HistoryRemoteDataSource {
  Future<HistoryModel> getHistory(int pageIndex, int pageSize);
}