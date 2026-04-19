import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/api/api_endpoint.dart';
import 'package:mock_mate_ai/api/api_services.dart';
import 'package:mock_mate_ai/api/model/session/submit_answer/submit_answer_model_dto.dart';
import 'package:mock_mate_ai/data/data_source/remote/session/submit_answer/submit_answer_remote_data_source.dart';
@Injectable(as: SubmitAnswerRemoteDataSource)
class SubmitAnswerRemoteDataSourceImpl implements SubmitAnswerRemoteDataSource {
  final ApiServices apiServices;

  SubmitAnswerRemoteDataSourceImpl(this.apiServices);
  @override
  Future<SubmitAnswerModelDTO> submitAnswer({required int sessionId}) async {
  try {
  final response = await apiServices.post(
    ApiEndpoint.submitAnswerApi(sessionId),
  );

  return SubmitAnswerModelDTO.fromJson(response.data);

} on DioException catch (e) {
  final message =
      e.response?.data['message'] ?? 'Something went wrong';

  throw Exception(message);
}
  }
}
