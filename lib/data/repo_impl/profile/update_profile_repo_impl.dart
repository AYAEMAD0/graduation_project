import 'dart:typed_data';
import 'package:injectable/injectable.dart';
import '../../../domain/entities/user/user_entity.dart';
import '../../../domain/repo/profile/update_profile_repo.dart';
import '../../data_source/remote/profile/update_profile_remote_data_source.dart';

@Injectable(as: UpdateProfileRepo)
class UpdateProfileRepoImpl implements UpdateProfileRepo {
  final UpdateProfileRemoteDataSource updateProfileRemoteDataSource;

  UpdateProfileRepoImpl(this.updateProfileRemoteDataSource);

  @override
  Future<UserEntity> updateProfile({
    required String displayName,
    required String phoneNumber,
    String? imagePath,
    Uint8List? imageBytes,
  }) async {
    final dto = await updateProfileRemoteDataSource.updateProfile(
      displayName: displayName,
      phoneNumber: phoneNumber,
      imagePath: imagePath,
      imageBytes: imageBytes,
    );

    return UserEntity(
      avatarPath: dto.avatarPath,
      displayName: dto.displayName,
      phoneNumber: dto.phoneNumber,
      userId: dto.userId,
    );
  }
}