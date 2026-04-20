import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/data/data_source/remote/session/submit_answer/submit_answer_remote_data_source.dart';
import 'package:mock_mate_ai/domain/entities/session/submit_answer/submit_answer_entity.dart';
import 'package:mock_mate_ai/domain/repo/session/submit_answer/submit_answer_repo.dart';
@Injectable(as: SubmitAnswerRepo)
class SubmitAnswerRepoImpl implements SubmitAnswerRepo {
  final SubmitAnswerRemoteDataSource submitAnswerRemoteDataSource;
  SubmitAnswerRepoImpl(this.submitAnswerRemoteDataSource);
  @override
  Future<SubmitAnswerEntity> submitAnswer({required int sessionId}) async {
    final result = await submitAnswerRemoteDataSource.submitAnswer(
      sessionId: sessionId,
    );
    return result.toEntity();
  }
}
