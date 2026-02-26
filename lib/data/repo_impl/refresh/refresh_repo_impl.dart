import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/data/data_source/remote/refresh/refresh_remote_data_source.dart';
import 'package:mock_mate_ai/domain/entities/refresh/refresh_entity.dart';
import 'package:mock_mate_ai/domain/repo/refresh/refresh_repo.dart';

@Injectable(as: RefreshRepo)
class RefreshRepoImpl implements RefreshRepo {
  final RefreshRemoteDataSource refreshRemoteDataSource;

  RefreshRepoImpl(this.refreshRemoteDataSource);

  @override
  Future<RefreshEntity> refresh(String refreshToken) async {
    final dto = await refreshRemoteDataSource.refresh(refreshToken);

    return RefreshEntity(
      accessToken: dto.accessToken,
      refreshToken: dto.refreshToken,
    );
  }
}
