import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/domain/entities/login/login_entity.dart';
import 'package:mock_mate_ai/domain/repo/login/login_repo.dart';
@injectable
class LoginUsecase {
  final LoginRepo loginRepo;
  LoginUsecase(this.loginRepo);

  Future<LoginEntity> call({required String email, required String password}) {
    return loginRepo.login(email: email, password: password);
  }
}
