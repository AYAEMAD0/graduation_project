import 'package:mock_mate_ai/api/model/auth/signup/signup_model_dto.dart';

abstract class SignupRemoteDataSource {
  Future<SignupModelDto> signup(Map<String, dynamic> data);
}
