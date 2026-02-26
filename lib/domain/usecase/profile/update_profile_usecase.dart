import 'dart:typed_data';

import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/domain/entities/user/user_entity.dart';
import '../../repo/profile/update_profile_repo.dart';

@injectable
class UpdateProfileUseCase {
  final UpdateProfileRepo updateProfileRepo;

  UpdateProfileUseCase(this.updateProfileRepo);

  Future<UserEntity> call({
    required String displayName,
    required String phoneNumber,
    String? imagePath,
    Uint8List? imageBytes,
  }) {
    return updateProfileRepo.updateProfile(
      displayName: displayName,
      phoneNumber: phoneNumber,
      imagePath: imagePath,
      imageBytes: imageBytes,
    );
  }
}