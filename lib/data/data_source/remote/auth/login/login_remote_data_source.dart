import 'package:mock_mate_ai/api/model/auth/login/login_model_dto.dart';

abstract class LoginRemoteDataSource {
  Future<LoginModelDto> login(Map<String, dynamic> data);
}