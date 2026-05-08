import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/api/api_endpoint.dart';
import 'package:mock_mate_ai/api/api_services.dart';
import 'package:mock_mate_ai/data/data_source/remote/session/interview_session/ai_interview_remote_data_source.dart';
import 'package:mock_mate_ai/api/model/session/ai_interview/ai_interview_session_model.dart';

@Injectable(as:AiInterviewRemoteDataSource )
class AiInterviewRemoteDataSourceImpl implements AiInterviewRemoteDataSource{
  final ApiServices apiServices ;
  AiInterviewRemoteDataSourceImpl(this.apiServices);
  @override
  Future<AiInterviewSessionModel> startAiInterviewSession({
    required List<int> cvBytes,
    required String cvFileName,
    required String jobDescription
  })async {
    final formData = FormData.fromMap({
      'jobDescription': jobDescription,
      'cvFile': MultipartFile.fromBytes(cvBytes, filename: cvFileName)
    });

    final response = await apiServices.post(
      ApiEndpoint.startAiInterviewApi,
      data: formData
    );
    return AiInterviewSessionModel.fromJson(response.data);


  }

}