import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/domain/entities/login/login_entity.dart';
import 'package:mock_mate_ai/domain/repo/login/login_repo.dart';
import '../../data_source/remote/login/login_remote_data_source.dart';

@Injectable(as: LoginRepo)
class LoginRepoImpl implements LoginRepo {
  final LoginRemoteDataSource loginRemoteDataSource;

  LoginRepoImpl(this.loginRemoteDataSource);
  @override
  Future<LoginEntity> login({required String email, required String password})async {
    final dto = await loginRemoteDataSource.login({
      'email': email,
      'password': password,
    });
    return LoginEntity(
        accessToken: dto.accessToken ?? '',
        refreshToken: dto.refreshToken ?? '',
        email: dto.profile?.email ??'',
        userName: dto.profile?.userName ?? '',
        role: dto.role ?? '');

  }

}