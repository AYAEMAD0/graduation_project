import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/api/model/signup/signup_model_dto.dart';
import '../../../../data/data_source/remote/signup/signup_remote_data_source.dart';
import '../../../api_endpoint.dart';
import '../../../api_services.dart';

@Injectable(as: SignupRemoteDataSource)
class SignupRemoteDataSourceImpl extends SignupRemoteDataSource {
  final ApiServices apiServices;

  SignupRemoteDataSourceImpl(this.apiServices);
  @override
  Future<SignupModelDto> signup(Map<String, dynamic> data) async {
    final response = await apiServices.post(
      ApiEndpoint.signupApi,
      data: data,
    );
    return SignupModelDto.fromJson(response.data);
  }

}
