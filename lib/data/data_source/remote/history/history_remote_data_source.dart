import 'package:mock_mate_ai/api/model/history/history_model_dto.dart';

abstract class HistoryRemoteDataSource {
  Future<HistoryModelDto> getHistory(int pageIndex, int pageSize);
}
