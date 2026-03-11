import 'package:injectable/injectable.dart';

import '../../../../../data/data_source/remote/session/answer_mcq/answer_mcq_remote_data_source.dart';
import '../../../../api_endpoint.dart';
import '../../../../api_services.dart';
import '../../../../model/session/answer_mcq/answer_mcq_request_model_dto.dart';
import '../../../../model/session/answer_mcq/answer_mcq_response_model_dto.dart';

@Injectable(as: AnswerMcqRemoteDataSource)
class AnswerMcqRemoteDataSourceImpl implements AnswerMcqRemoteDataSource {
  final ApiServices apiServices;

  AnswerMcqRemoteDataSourceImpl(this.apiServices);

  @override
  Future<AnswerMcqResponseModelDto> answerMcq({
    required int sessionId,
    required AnswerMcqRequestModelDto dto,
  }) async {
    final response = await apiServices.put(
      ApiEndpoint.answerMcqApi(sessionId),
      data: dto.toJson(),
    );
    return AnswerMcqResponseModelDto.fromJson(
      response.data as Map<String, dynamic>,
    );
  }
}
