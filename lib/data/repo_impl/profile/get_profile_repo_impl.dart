import 'package:injectable/injectable.dart';
import '../../../domain/entities/user/user_entity.dart';
import '../../../domain/repo/profile/get_profile_repo.dart';
import '../../data_source/remote/profile/get_profile_remote_data_source.dart';

@Injectable(as: GetProfileRepo)
class GetProfileRepoImpl implements GetProfileRepo {
  final GetProfileRemoteDataSource remoteDataSource;

  GetProfileRepoImpl(this.remoteDataSource);

  @override
  Future<UserEntity> getUserById(int id) async {
    final dto = await remoteDataSource.getUserById(id);

    return UserEntity(
      userId: dto.userId,
      displayName: dto.displayName,
      phoneNumber: dto.phoneNumber,
      avatarPath: dto.avatarPath,
    );
  }
}