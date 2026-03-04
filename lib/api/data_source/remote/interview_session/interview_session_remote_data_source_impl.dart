import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/api/api_endpoint.dart';
import 'package:mock_mate_ai/api/api_services.dart';
import '../../../../data/data_source/remote/interview_session/interview_session_remote_data_source.dart';
import '../../../model/interview_session/interview_session_model_dto.dart';

@Injectable(as: InterviewSessionRemoteDataSource)
class InterviewSessionRemoteDataSourceImpl
    implements InterviewSessionRemoteDataSource {
  final ApiServices apiServices;

  InterviewSessionRemoteDataSourceImpl(this.apiServices);

  @override
  Future<InterviewSessionModelDto> startInterviewSession({
    required List<int> cvBytes,
    required String cvFileName,
    required String jobDescription,
  }) async {
    final formData = FormData.fromMap({
      'JobDescription': jobDescription,
      'CvFile': MultipartFile.fromBytes(cvBytes, filename: cvFileName),
    });

    final response = await apiServices.post(
      ApiEndpoint.startInterviewSessionApi,
      data: formData,
    );

    return InterviewSessionModelDto.fromJson(response.data);
  }
}
