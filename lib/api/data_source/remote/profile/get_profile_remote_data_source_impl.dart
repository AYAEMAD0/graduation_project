import 'package:injectable/injectable.dart';
import '../../../../api/api_endpoint.dart';
import '../../../../api/api_services.dart';
import '../../../../api/model/user/user_model_dto.dart';
import '../../../../data/data_source/remote/profile/get_profile_remote_data_source.dart';

@Injectable(as: GetProfileRemoteDataSource)
class GetProfileRemoteDataSourceImpl
    implements GetProfileRemoteDataSource {
  final ApiServices apiServices;

  GetProfileRemoteDataSourceImpl(this.apiServices);

  @override
  Future<UserModelDto> getUserById(int id) async {
    final response = await apiServices.get(
      "${ApiEndpoint.getUserByIdApi}/$id",
    );

    return UserModelDto.fromJson(response.data);
  }
}