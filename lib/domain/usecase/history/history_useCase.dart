import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/domain/entities/history/history_Interview_entity.dart';
import 'package:mock_mate_ai/domain/repo/history/history_repo.dart';
@injectable
class GetHistoryUseCase {
  final HistoryRepo historyRepo;

  GetHistoryUseCase(this.historyRepo);

  Future<List<HistoryInterviewEntity>> call(int pageIndex, int pageSize) async {
    return await historyRepo.getHistory(pageIndex, pageSize);
  }
}