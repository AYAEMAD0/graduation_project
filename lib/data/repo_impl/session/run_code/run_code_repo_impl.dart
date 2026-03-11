import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/domain/entities/session/run_code/run_code_request_entity.dart';

import '../../../../api/model/session/run_code/run_code_request_model_dto.dart';
import '../../../../domain/entities/session/run_code/run_code_response_entity.dart';
import '../../../../domain/repo/session/run_code/run_code_repo.dart';
import '../../../data_source/remote/session/run_code/run_code_remote_data_source.dart';

@Injectable(as: RunCodeRepo)
class RunCodeRepoImpl implements RunCodeRepo {
  final RunCodeRemoteDataSource runCodeRemoteDataSource;

  RunCodeRepoImpl(this.runCodeRemoteDataSource);

  @override
  Future<RunCodeResponseEntity> runCode({
    required int sessionId,
    required RunCodeRequestEntity entity,
  }) async {
    final dto = RunCodeRequestModelDto(
      questionId: entity.questionId,
      languageId: entity.languageId,
      sourceCode: entity.sourceCode,
    );

    final result = await runCodeRemoteDataSource.runCode(
      sessionId: sessionId,
      dto: dto,
    );

    return result.toEntity();
  }
}
