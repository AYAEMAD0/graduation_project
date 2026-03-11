import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/domain/entities/auth/refresh/refresh_entity.dart';
import 'package:mock_mate_ai/domain/repo/auth/refresh/refresh_repo.dart';

@Injectable()
class RefreshUsecase {
  final RefreshRepo refreshRepo;
  RefreshUsecase(this.refreshRepo);

  Future<RefreshEntity> call(String refreshToken) {
    return refreshRepo.refresh(refreshToken);
  }
}
