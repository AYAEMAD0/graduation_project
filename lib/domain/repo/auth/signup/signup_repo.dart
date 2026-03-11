import 'package:mock_mate_ai/domain/entities/auth/signup/signup_entity.dart';

abstract class SignupRepo {
  Future<SignupEntity> signup({
    required String username,
    required String email,
    required String phoneNumber,
    required String password,
    required String displayName,
    required String role,
    required String avatarPath,
  });
}
