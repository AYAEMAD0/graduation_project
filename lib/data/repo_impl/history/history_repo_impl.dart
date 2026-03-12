import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/data/data_source/remote/history/history_remot_data_source.dart';
import 'package:mock_mate_ai/domain/entities/history/history_Interview_entity.dart';
import 'package:mock_mate_ai/domain/repo/history/history_repo.dart';

@Injectable(as: HistoryRepo)
class HistoryRepoImpl implements HistoryRepo {
  final HistoryRemoteDataSource historyRemoteDataSource;
  HistoryRepoImpl(this.historyRemoteDataSource);
  @override
  Future<List<HistoryInterviewEntity>> getHistory(
    int pageIndex,
    int pageSize,
  ) async {
    final historyModel = await historyRemoteDataSource.getHistory(
      pageIndex,
      pageSize,
    );
    return historyModel.data?.map((item) => item.toEntity()).toList() ?? [];
  }
}
