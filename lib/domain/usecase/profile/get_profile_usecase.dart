import 'package:injectable/injectable.dart';
import '../../entities/user/user_entity.dart';
import '../../repo/profile/get_profile_repo.dart';

@injectable
class GetProfileUseCase {
  final GetProfileRepo repo;

  GetProfileUseCase(this.repo);

  Future<UserEntity> call(int id) {
    return repo.getUserById(id);
  }
}