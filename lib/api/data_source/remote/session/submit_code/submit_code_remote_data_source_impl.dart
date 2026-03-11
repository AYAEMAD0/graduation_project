import 'package:injectable/injectable.dart';

import '../../../../../data/data_source/remote/session/submit_code/submit_code_remote_data_source.dart';
import '../../../../api_endpoint.dart';
import '../../../../api_services.dart';
import '../../../../model/session/submit_code/submit_code_request_model_dto.dart';
import '../../../../model/session/submit_code/submit_code_response_model_dto.dart';

@Injectable(as: SubmitCodeRemoteDataSource)
class SubmitCodeRemoteDataSourceImpl implements SubmitCodeRemoteDataSource {
  final ApiServices apiServices;

  SubmitCodeRemoteDataSourceImpl(this.apiServices);

  @override
  Future<SubmitCodeResponseModelDto> submitCode({
    required int sessionId,
    required SubmitCodeRequestModelDto dto,
  }) async {
    final response = await apiServices.post(
      ApiEndpoint.submitCodeApi(sessionId),
      data: dto.toJson(),
    );
    return SubmitCodeResponseModelDto.fromJson(
      response.data as Map<String, dynamic>,
    );
  }
}
