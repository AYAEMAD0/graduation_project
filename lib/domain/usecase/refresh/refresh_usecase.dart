import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/domain/entities/refresh/refresh_entity.dart';
import 'package:mock_mate_ai/domain/repo/refresh/refresh_repo.dart';

@Injectable()
class RefreshUsecase {
  final RefreshRepo refreshRepo;
  RefreshUsecase(this.refreshRepo);

  Future<RefreshEntity> call(String refreshToken) {
    return refreshRepo.refresh(refreshToken);
  }
}
