import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/api/model/auth/logout/logout_model_dto.dart';

import '../../../../../data/data_source/remote/auth/logout/logout_remote_data_source.dart';
import '../../../../api_endpoint.dart';
import '../../../../api_services.dart';

@Injectable(as: LogoutRemoteDataSource)
class LogoutRemoteDataSourceImpl implements LogoutRemoteDataSource {
  final ApiServices apiServices;
  LogoutRemoteDataSourceImpl(this.apiServices);

  @override
  Future<LogoutModelDto> logout(String refreshToken) async {
    final response = await apiServices.post(
      ApiEndpoint.logoutApi,
      data: {"refreshToken": refreshToken},
    );
    return LogoutModelDto.fromJson(response.data);
  }
}