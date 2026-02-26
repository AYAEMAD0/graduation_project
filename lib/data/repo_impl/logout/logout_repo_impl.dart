import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/domain/entities/logout/logout_entity.dart';
import '../../../domain/repo/auth/token_storage.dart';
import '../../../domain/repo/logout/logout_repo.dart';
import '../../data_source/remote/logout/logout_remote_data_source.dart';

@Injectable(as: LogoutRepo)
class LogoutRepoImpl implements LogoutRepo {
  final LogoutRemoteDataSource remoteDataSource;
  final TokenStorage tokenStorage;
  LogoutRepoImpl(this.remoteDataSource, this.tokenStorage);

  @override
  Future<LogoutEntity> logout() async {
    final refreshToken = await tokenStorage.getRefreshToken();
    if (refreshToken != null) {
      final dto = await remoteDataSource.logout(refreshToken);
      await tokenStorage.clearTokens();
      return dto.toEntity();
    }
    return LogoutEntity(message: "No token found");
  }
}