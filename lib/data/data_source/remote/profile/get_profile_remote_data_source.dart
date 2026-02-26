import 'package:mock_mate_ai/api/model/user/user_model_dto.dart';

abstract class GetProfileRemoteDataSource {
  Future<UserModelDto> getUserById(int id);
}