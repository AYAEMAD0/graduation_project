import 'package:injectable/injectable.dart';
import '../../entities/logout/logout_entity.dart';
import '../../repo/logout/logout_repo.dart';

@injectable
class LogoutUseCase {
  final LogoutRepo repo;
  LogoutUseCase(this.repo);

  Future<LogoutEntity> call() async {
    return await repo.logout();
  }
}