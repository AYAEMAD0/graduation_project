import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/domain/entities/session/get_session/get_session_entity.dart';

import '../../../../domain/repo/session/get_session/get_session_repo.dart';
import '../../../data_source/remote/session/get_session/get_session_remote_data_source.dart';

@Injectable(as: GetSessionRepo)
class GetSessionRepoImpl implements GetSessionRepo {
  final GetSessionRemoteDataSource getSessionRemoteDataSource;

  GetSessionRepoImpl(this.getSessionRemoteDataSource);

  @override
  Future<GetSessionEntity> getSession({required int sessionId}) async {
    final result = await getSessionRemoteDataSource.getSession(
      sessionId: sessionId,
    );
    return result.toEntity();
  }
}
