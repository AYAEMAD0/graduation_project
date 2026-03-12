import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/domain/entities/history/history_entity.dart';
import 'package:mock_mate_ai/domain/repo/history/history_repo.dart';

@injectable
class GetHistoryUsecase {
  final HistoryRepo historyRepo;

  GetHistoryUsecase(this.historyRepo);

  Future<HistoryEntity> call(int pageIndex, int pageSize) async {
    return await historyRepo.getHistory(pageIndex, pageSize);
  }
}