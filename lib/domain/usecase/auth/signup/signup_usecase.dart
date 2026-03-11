import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/domain/entities/auth/signup/signup_entity.dart';
import 'package:mock_mate_ai/domain/repo/auth/signup/signup_repo.dart';

@injectable
class SignupUsecase {
  final SignupRepo signupRepo;

  SignupUsecase({required this.signupRepo});

  Future<SignupEntity> call({
    required String username,
    required String email,
    required String phoneNumber,
    required String password,
    required String displayName,
    required String role,
    required String avatarPath,
  }) {
    return signupRepo.signup(
      username: username,
      email: email,
      phoneNumber: phoneNumber,
      password: password,
      displayName: displayName,
      role: role,
      avatarPath: avatarPath,
    );
  }
}
