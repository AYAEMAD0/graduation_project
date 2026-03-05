import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/domain/entities/auth/refresh/refresh_entity.dart';
import 'package:mock_mate_ai/domain/repo/auth/refresh/refresh_repo.dart';

import '../../../data_source/remote/auth/refresh/refresh_remote_data_source.dart';

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
