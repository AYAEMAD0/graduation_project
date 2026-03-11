import 'package:injectable/injectable.dart';

import '../../../entities/auth/logout/logout_entity.dart';
import '../../../repo/auth/logout/logout_repo.dart';

@injectable
class LogoutUseCase {
  final LogoutRepo repo;
  LogoutUseCase(this.repo);

  Future<LogoutEntity> call() async {
    return await repo.logout();
  }
}