import 'package:injectable/injectable.dart';
import '../../../domain/entities/signup/signup_entity.dart';
import '../../../domain/repo/signup/signup_repo.dart';
import '../../data_source/remote/signup/signup_remote_data_source .dart';

@Injectable(as: SignupRepo)
class SignupRepoImpl implements SignupRepo {
  final SignupRemoteDataSource signupRemoteDataSource;

  SignupRepoImpl({required this.signupRemoteDataSource});

  @override
  Future<SignupEntity> signup({
    required String username,
    required String email,
    required String phoneNumber,
    required String password,
    required String displayName,
    required String role,
    required String avatarPath,
  }) async {
    final dto = await signupRemoteDataSource.signup({
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'displayName': displayName,
      'role': role,
      'avatarPath': avatarPath,
    });

    return SignupEntity(
      userId: dto.userId,
      accessToken: dto.accessToken,
      refreshToken: dto.refreshToken,
      code: dto.code,
      message: dto.message,
      validationErrors: dto.validationErrors,
    );
  }
}
