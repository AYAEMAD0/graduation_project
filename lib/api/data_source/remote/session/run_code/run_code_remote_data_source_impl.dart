import 'package:injectable/injectable.dart';

import '../../../../../data/data_source/remote/session/run_code/run_code_remote_data_source.dart';
import '../../../../api_endpoint.dart';
import '../../../../api_services.dart';
import '../../../../model/session/run_code/run_code_model_dto.dart';

@Injectable(as: RunCodeRemoteDataSource)
class RunCodeRemoteDataSourceImpl implements RunCodeRemoteDataSource {
  final ApiServices apiServices;

  RunCodeRemoteDataSourceImpl(this.apiServices);

  @override
  Future<RunCodeResponseDto> runCode({
    required int sessionId,
    required RunCodeRequestDto dto,
  }) async {
    final response = await apiServices.post(
      ApiEndpoint.runCodeApi(sessionId),
      data: dto.toJson(),
    );
    return RunCodeResponseDto.fromJson(response.data as Map<String, dynamic>);
  }
}
