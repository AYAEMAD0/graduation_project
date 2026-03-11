import 'package:injectable/injectable.dart';

import '../../../../api/model/session/submit_code/submit_code_request_model_dto.dart';
import '../../../../domain/entities/session/submit_code/submit_code_request_entity.dart';
import '../../../../domain/entities/session/submit_code/submit_code_response_entity.dart';
import '../../../../domain/repo/session/submit_code/submit_code_repo.dart';
import '../../../data_source/remote/session/submit_code/submit_code_remote_data_source.dart';

@Injectable(as: SubmitCodeRepo)
class SubmitCodeRepoImpl implements SubmitCodeRepo {
  final SubmitCodeRemoteDataSource submitCodeRemoteDataSource;

  SubmitCodeRepoImpl(this.submitCodeRemoteDataSource);

  @override
  Future<SubmitCodeResponseEntity> submitCode({
    required int sessionId,
    required SubmitCodeRequestEntity entity,
  }) async {
    final dto = SubmitCodeRequestModelDto(
      questionId: entity.questionId,
      languageId: entity.languageId,
      sourceCode: entity.sourceCode,
    );
    final result = await submitCodeRemoteDataSource.submitCode(
      sessionId: sessionId,
      dto: dto,
    );
    return result.toEntity();
  }
}
