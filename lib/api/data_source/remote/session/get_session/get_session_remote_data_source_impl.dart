import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/api/model/session/get_session/get_session_model_dto.dart';
import '../../../../../data/data_source/remote/session/get_session/get_session_remote_data_source.dart';
import '../../../../api_endpoint.dart';
import '../../../../api_services.dart';

@Injectable(as: GetSessionRemoteDataSource)
class GetSessionRemoteDataSourceImpl implements GetSessionRemoteDataSource {
  final ApiServices apiServices;

  GetSessionRemoteDataSourceImpl(this.apiServices);

  @override
  Future<GetSessionModelDto> getSession({required int sessionId}) async {
    final response = await apiServices.get(
      ApiEndpoint.getSessionApi(sessionId),
    );
    return GetSessionModelDto.fromJson(response.data as Map<String, dynamic>);
  }
}
