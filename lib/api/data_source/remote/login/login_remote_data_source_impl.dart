import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/api/api_endpoint.dart';
import 'package:mock_mate_ai/api/api_services.dart';
import 'package:mock_mate_ai/api/model/login/login_model_dto.dart';
import '../../../../data/data_source/remote/login/login_remote_data_source.dart';

@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final ApiServices apiServices;
  LoginRemoteDataSourceImpl(this.apiServices);
  @override
  Future<LoginModelDto> login(Map<String, dynamic> data) async {
    final response = await apiServices.post(ApiEndpoint.loginApi, data: data);
    return LoginModelDto.fromJson(response.data);
  }
}
