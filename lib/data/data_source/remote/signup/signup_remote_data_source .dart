import '../../../../api/model/signup/signup_model_dto.dart';

abstract class SignupRemoteDataSource {
  Future<SignupModelDto> signup(Map<String, dynamic> data);
}