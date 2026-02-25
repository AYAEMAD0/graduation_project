import '../../entities/user/user_entity.dart';

abstract class GetProfileRepo {
  Future<UserEntity> getUserById(int id);
}